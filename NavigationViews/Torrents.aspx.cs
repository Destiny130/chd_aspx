using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Views_Torrents : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();
    string search = null;

    public IEnumerable<Ttype> TypeList_GetData()
    {
        return myEntities.Ttypes.OrderBy(t => t.Id).ToList();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("search")))
        {
            string searchs = Request.QueryString.Get("search");
            search = Server.UrlDecode(searchs);
            SearchText.Text = search;
            //TODO: search字段还要进一步处理
        }

        if (string.IsNullOrEmpty(Request.QueryString.Get("cat")))
        {
            choosenType.catList = null;
        }
    }

    protected string GetTypeName(object TypeId)
    {
        return myEntities.Ttypes.Where(t => t.Id == (Int32)TypeId).Select(t => t.Tname).ToString();
    }

    protected void TypeListButton_Click(object sender, EventArgs e)
    {
        for (var i = 0; i < TypeList.Items.Count; i++)
        {
            this.TypeList.Items[i].Selected = true;
        }
    }



    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable<Torrent> TorrentGrid_GetData()
    {
        if (search != null && choosenType.catList != null)
        {
            return myEntities.Torrents.Where(t => (t.Title.Contains(search) && choosenType.catList.Contains(t.TypeId))).OrderByDescending(t => t.UpdateDateTime);
        }
        else if (search != null && choosenType.catList == null)
        {
            return myEntities.Torrents.Where(t => t.Title.Contains(search)).OrderByDescending(t => t.UpdateDateTime);
        }
        else if (search == null && choosenType.catList != null)
        {
            return myEntities.Torrents.Where(t => choosenType.catList.Contains(t.TypeId)).OrderByDescending(t => t.UpdateDateTime);
        }
        else
        {
            return myEntities.Torrents.OrderByDescending(t => t.UpdateDateTime);
        }
    }

    protected void TorrentGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        LinkButton authorLink = e.Row.FindControl("AuthorLink") as LinkButton;
        if (authorLink != null)
        {
            string userName = ((LinkButton)authorLink).CommandArgument;
            var userId = myEntities.Users.Where(u => u.UserName == userName).Select(u => u.UID).Single();
            authorLink.PostBackUrl = string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userId);
        }
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        string searchString = null;
        if (!string.IsNullOrEmpty(SearchText.Text.Replace(" ", "")))
        {
            searchString = SearchText.Text;
            searchString.Replace(" ", "+");
        }

        string cat = string.Format("");
        if (TypeList.SelectedValue.Count() > 0)
        {
            //choosenType.catList = null;
            choosenType.catList = new List<int>();
            foreach (ListItem myItem in TypeList.Items)
            {
                if (myItem.Selected)
                {
                    int i = Convert.ToInt32(myItem.Value);
                    choosenType.catList.Add(i);
                    cat += i + "+";
                }
            }
            if (searchString != null)
            {
                Response.Redirect(string.Format("~/NavigationViews/Torrents.aspx?search={0}&cat={1}", Server.UrlEncode(searchString), Server.UrlEncode(cat)));
            }
            else
            {
                Response.Redirect(string.Format("~/NavigationViews/Torrents.aspx?cat={0}", Server.UrlEncode(cat)));
            }
        }

        if (searchString != null)
        {
            Response.Redirect(string.Format("~/NavigationViews/Torrents.aspx?search={0}", Server.UrlEncode(searchString)));
        }
        else
        {
            Response.Redirect(string.Format("~/NavigationViews/Torrents.aspx?search="));
        }
    }

    protected void TypeList_DataBound(object sender, EventArgs e)
    {
        if (choosenType.catList != null)
        {
            foreach (ListItem myItem in TypeList.Items)
            {
                int currentValue = Convert.ToInt32(myItem.Value);
                if (choosenType.catList.Contains(currentValue))
                {
                    myItem.Selected = true;
                }
            }
        }
    }
}