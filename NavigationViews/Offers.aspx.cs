using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Views_Offers : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();
    string search = null;
    int typeid = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("search")))
        {
            search = Request.QueryString.Get("search");
            SearchText.Text = search;
        }
        if (!string.IsNullOrEmpty(Request.QueryString.Get("typeid")))
        {
            typeid = Convert.ToInt32(Request.QueryString.Get("typeid"));
        }
    }

    public IEnumerable<Ttype> TypeList_GetData()
    {
        return myEntities.Ttypes.OrderBy(t => t.Id).ToList();
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable OfferGrid_GetData()
    {
        if (search != null && typeid != -1)
            return myEntities.OfferTorrents.Where(o => (o.Title.Contains(search) && o.TypeId == typeid));
        else if (search == null && typeid != -1)
            return myEntities.OfferTorrents.Where(o => o.TypeId == typeid);
        else if (search != null && typeid == -1)
            return myEntities.OfferTorrents.Where(o => o.Title.Contains(search));
        else
            return myEntities.OfferTorrents;
    }

    protected string GetUserUrl(string AuthorName)
    {
        int userId = myEntities.Users.Where(u => u.UserName == AuthorName).Select(u => u.UID).Single();
        return string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userId);
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {
        if (SearchText.Text != null)
        {
            search = SearchText.Text;
        }
        if (TypeList.SelectedIndex > 0)
        {
            typeid = TypeList.SelectedIndex;
            if (search != null)
            {
                Response.Redirect(string.Format("~/NavigationViews/Offers.aspx?search={0}&typeid={1}", search, typeid));
            }
            Response.Redirect(string.Format("~/NavigationViews/Offers.aspx?typeid={0}", typeid));
        }
        if (search != null)
        {
            Response.Redirect(string.Format("~/NavigationViews/Offers.aspx?search={0}", search));
        }
        else
        {
            Response.Redirect(string.Format("~/NavigationViews/Offers.aspx"));
        }
    }


    protected void OfferGrid_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        switch (e.Row.RowType)
        {
            case DataControlRowType.DataRow:
                {
                    OfferTorrent offer = (OfferTorrent)e.Row.DataItem;
                    int userId = myEntities.Users.Where(u => u.UserName == offer.AuthorName).Select(u => u.UID).Single();
                    LinkButton authorLink = e.Row.FindControl("AuthorLink") as LinkButton;
                    if (authorLink != null)
                    {
                        authorLink.PostBackUrl = string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userId);
                    }
                }
                break;
        }
    }

    protected void TypeList_DataBound(object sender, EventArgs e)
    {
        if (typeid != -1)
        {
            TypeList.SelectedIndex = typeid;
        }
    }
}