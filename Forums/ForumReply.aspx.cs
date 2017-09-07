using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Forums_ForumReply : BasePage
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
            Label1.Text = myEntities.ViewForums.Where(v => v.Id == _id).Select(v => v.Title).Single();
            Label1.DataBind();
        }
    }

    public void DetailsView1_InsertItem()
    {
        if (_id > -1)
        {
            ForumReply forumReply = new ForumReply();
            TryUpdateModel(forumReply);
            if (ModelState.IsValid)
            {
                forumReply.ViewForumId = _id;
                forumReply.CreateDateTime = DateTime.Now;
                forumReply.UpdateDateTime = DateTime.Now;
                forumReply.UserName = User.Identity.Name;
                myEntities.ForumReplies.Add(forumReply);
                myEntities.SaveChanges();
                Response.Redirect(string.Format("ViewTopic.aspx?Id={0}", forumReply.ViewForumId.ToString()));
            }
        }
    }

    protected string GetViewTopicURL()
    {
        string returnURL = string.Format("ViewTopic.aspx?Id={0}", _id.ToString());
        return returnURL;
    }
}