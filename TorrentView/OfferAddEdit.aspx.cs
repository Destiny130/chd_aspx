using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NavigationViews_OfferAddEdit : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();
    int _id = -1;

    public IEnumerable<Ttype> TypeList_GetData()
    {
        return myEntities.Ttypes.OrderBy(t => t.Id).ToList();
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
        {
            _id = Convert.ToInt32(Request.QueryString.Get("Id"));
        }
        if (!Page.IsPostBack && _id > -1)
        {
            OfferTorrent offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
            TypeList.SelectedIndex = offer.TypeId;
            TorrentTitle.Text = offer.Title;
            TorrentSubtitle.Text = offer.SubTitle;
            BodyText.Text = offer.Body;

            OfferDeatilsLink.Text = offer.Title;
            OfferEditTitle.Visible = true;
        }

    }

    protected string GetOfferDetailsUrl()
    {
        return string.Format("OfferDetails.aspx?Id={0}", _id);
    }
    
    protected void SubmitButton_Click(object sender, EventArgs e)
    {
        OfferTorrent offer;
        if (_id == -1)
        {
            offer = new OfferTorrent();
            offer.CreateDateTime = DateTime.Now;
            offer.UpdateDateTime = offer.CreateDateTime;
            offer.AuthorName = User.Identity.Name;
            offer.Authorized = false;
            myEntities.OfferTorrents.Add(offer);
        }
        else
        {
            offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
            offer.UpdateDateTime = DateTime.Now;
        }

        FileUpload torrentFileUpload = (FileUpload)OfferAddEditTable.FindControl("TorrentFileUpload");
        if (!torrentFileUpload.HasFile || !torrentFileUpload.FileName.ToLower().EndsWith(".torrent"))
        {
            CustomValidator cusValTorrent = (CustomValidator)OfferAddEditTable.FindControl("CusValTorrent");
            cusValTorrent.IsValid = false;
            ModelState.AddModelError("Invalid", cusValTorrent.ErrorMessage);
        }
        if (ModelState.IsValid && Page.IsValid)
        {
            string virtualFolder = "~/TorrentFolder/";
            string physicalFolder = Server.MapPath(virtualFolder);
            string fileName = torrentFileUpload.FileName;
            string extension = System.IO.Path.GetExtension(torrentFileUpload.FileName);

            torrentFileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));
            offer.TorrentFileUrl = virtualFolder + fileName;
        }

        offer.TypeId = TypeList.SelectedIndex;
        offer.Title = TorrentTitle.Text;
        offer.SubTitle = TorrentSubtitle.Text;
        offer.Body = BodyText.Text;
        myEntities.SaveChanges();

        Response.Redirect(string.Format("~/TorrentView/OfferDetails.aspx?Id={0}", offer.Id));
    }

    protected void OfferDeatilsLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/TorrentView/OfferDetails.aspx?Id={0}", _id));
    }
}