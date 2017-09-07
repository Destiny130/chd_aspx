using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.ModelBinding;

public partial class Forums_NewForum : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {

        Forum forum = new Forum();
        myEntities.Fora.Add(forum);
        forum.ForumName = ForumNameText.Text;
        forum.ForumDescription = ForumDesText.Text;
        forum.Moderator = ForumModeratorText.Text;

        myEntities.SaveChanges();
        Response.Redirect("~/NavigationViews/Forums.aspx");
    }
}