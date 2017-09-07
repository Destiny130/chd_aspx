using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserHistory_ViewComments : BasePage
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
            ViewCommentsTable.Visible = true;
            NoComment.Visible = false;

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
    public IQueryable<TorrentComment> TorrentCommentListView_GetData()
    {
        return (from u in myEntities.Users
                join c in myEntities.TorrentComments on u.UserName equals c.AuthorName
                where u.UID == _id
                select c);
    }
}