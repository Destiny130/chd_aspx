using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Forums_ForumEdit : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();
    int _id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
        {
            _id = Convert.ToInt32(Request.QueryString.Get("Id"));
        }
        if (!Page.IsPostBack && _id > -1)
        {
            ViewForum viewForum = (from f in myEntities.ForumReplies
                                   join v in myEntities.ViewForums on f.ViewForumId equals v.Id
                                   where f.Id == _id
                                   select v).Single();
            if (viewForum != null)
            {
                TitleLinkButton.Text = viewForum.Title;
            }

            ForumReply forumReply = myEntities.ForumReplies.Where(f => f.Id == _id).Single();
            if (forumReply != null)
            {
                EditContentText.Text = forumReply.ReplyContent;
            }
        }
    }

    protected void TitleLinkButton_Click(object sender, EventArgs e)
    {
        var viewForumId = myEntities.ForumReplies.Where(f => f.Id == _id).Select(f => f.ViewForumId).Single();
        Response.Redirect(string.Format("~/Forums/ViewTopic.aspx?Id={0}", viewForumId.ToString()));
    }


    protected void EditButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            ForumReply forumReply = myEntities.ForumReplies.Where(f => f.Id == _id).Single();
            forumReply.UpdateDateTime = DateTime.Now;
            forumReply.ReplyContent = EditContentText.Text;
            myEntities.SaveChanges();
            Response.Redirect(string.Format("~/Forums/ViewTopic.aspx?Id={0}", forumReply.ViewForumId.ToString()));
        }
    }
}