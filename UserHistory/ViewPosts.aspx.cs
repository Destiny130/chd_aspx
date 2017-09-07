using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Web.Security;

public partial class UserHistory_ViewPosts : BasePage
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
            ViewPostsTable.Visible = true;
            NoPost.Visible = false;

            User user = myEntities.Users.Where(u => u.UID == _id).Single();
            UserDetailsLink.Text = user.UserName;
        }
    }

    protected void UserDetailsLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", _id));
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable<ForumReply> ViewPostsListView_GetData()
    {
        return (from f in myEntities.ForumReplies
                join u in myEntities.Users on f.UserName equals u.UserName
                where u.UID == _id
                select f);
    }
}