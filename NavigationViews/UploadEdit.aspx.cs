using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity.Validation;

public partial class Views_UploadEdit : BasePage
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
            Torrent torrent = myEntities.Torrents.Where(t => t.Id == _id).Single();
            TypeList.SelectedIndex = torrent.TypeId;
            TorrentTitle.Text = torrent.Title;
            TorrentSubtitle.Text = torrent.SubTitle;
            SummaryText.Text = torrent.Body;
            NoAuthorizedTable.Visible = false;
        }

        if (User.IsInRole("CHD"))
        {
            NoAuthorizedTable.Visible = false;
            UploadTable.Visible = true;
        }
    }

    public IEnumerable<Ttype> TypeList_GetData()
    {
        return (from r in myEntities.Ttypes
                orderby r.Id
                select r).ToList();
    }

    protected void TorrentAdd_Click(object sender, EventArgs e)
    {
        Torrent torrent;
        if (_id == -1)
        {
            torrent = new Torrent();
            torrent.CreateDateTime = DateTime.Now;
            torrent.UpdateDateTime = torrent.CreateDateTime;
            torrent.AuthorName = User.Identity.Name;
            myEntities.Torrents.Add(torrent);
        }
        else
        {
            torrent = myEntities.Torrents.Where(t => t.Id == _id).Single();
            torrent.UpdateDateTime = DateTime.Now;
        }
        torrent.TypeId = TypeList.SelectedIndex;
        torrent.Title = TorrentTitle.Text;
        torrent.SubTitle = TorrentSubtitle.Text;
        torrent.Body = SummaryText.Text;

        FileUpload torrentFileUpload = (FileUpload)UploadTable.FindControl("TorrentFileUpload");
        if (!torrentFileUpload.HasFile || !torrentFileUpload.FileName.ToLower().EndsWith(".torrent"))
        {
            CustomValidator cusValTorrent = (CustomValidator)UploadTable.FindControl("CusValTorrent");
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
            torrent.TorrentFileUrl = virtualFolder + fileName;
            myEntities.SaveChanges();
        }

        myEntities.SaveChanges();
        Response.Redirect(string.Format("~/TorrentView/TorrentDetails.aspx?Id={0}", torrent.Id));

    }
}