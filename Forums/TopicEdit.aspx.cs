using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Forums_TopicEdit : BasePage
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
            ForumReply forumReply = myEntities.ForumReplies.Where(f => f.Id == _id).Single();
            if (viewForum != null)
            {
                TitleLinkButton.Text = viewForum.Title;

                EditTitleTextBox.Text = viewForum.Title;   //编辑框内显示待编辑的标题
            }
            if (forumReply != null)
            {
                EditContentTextBox.Text = forumReply.ReplyContent;
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
        ViewForum viewForum = (from f in myEntities.ForumReplies
                               join v in myEntities.ViewForums on f.ViewForumId equals v.Id
                               where f.Id == _id
                               select v).Single();
        ForumReply forumReply = myEntities.ForumReplies.Where(f => f.Id == _id).Single();

        if ((viewForum.Title != EditTitleTextBox.Text) || (forumReply.ReplyContent != EditContentTextBox.Text))
        {
            forumReply.UpdateDateTime = DateTime.Now;

            viewForum.Title = EditTitleTextBox.Text;
            forumReply.ReplyContent = EditContentTextBox.Text;
            EditButton.Text = "最后编辑于 " + forumReply.UpdateDateTime.ToString();
            EditButton.Visible = true;
        }


        myEntities.SaveChanges();
        Response.Redirect(string.Format("~/Forums/ViewTopic.aspx?Id={0}", viewForum.Id.ToString()));
    }
}