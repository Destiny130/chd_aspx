using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Forums_NewTopic : BasePage
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
            var forum = myEntities.Fora.Where(f => f.Id == _id).Single();
            BackViewForumLinkButton.Text = forum.ForumName.ToString();
        }
    }

    protected void BackViewForumLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/Forums/ViewForum.aspx?Id={0}", _id));
    }

    protected void InsertButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            ViewForum viewForum = new ViewForum();

            viewForum.ForumId = _id;
            viewForum.Title = TitleTextBox.Text;
            viewForum.UserName = User.Identity.Name;
            myEntities.ViewForums.Add(viewForum);
            myEntities.SaveChanges();


            ForumReply forumReply = new ForumReply();

            forumReply.ViewForumId = viewForum.Id;
            forumReply.ReplyContent = ReplyContentTextBox.Text;
            forumReply.CreateDateTime = DateTime.Now;
            forumReply.UpdateDateTime = DateTime.Now;
            forumReply.UserName = User.Identity.Name;
            myEntities.ForumReplies.Add(forumReply);
            myEntities.SaveChanges();
            Response.Redirect(string.Format("~/Forums/ViewTopic.aspx?Id={0}", viewForum.Id));
        }
    }
}