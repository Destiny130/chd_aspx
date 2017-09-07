using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.Entity.Validation;
using System.Text;

public partial class TorrentView_OfferDeatils : BasePage
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
            NoIdTable.Visible = false;
            OfferDetailsTable.Visible = true;
            if (User.IsInRole("CHD"))
            {
                AuthorizationButton.Visible = true;
            }

            OfferTorrent offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
            if (User.IsInRole("CHD") || User.Identity.Name == offer.AuthorName)
            {
                EditButton.Visible = true;
                DeleteButton.Visible = true;
            }

            if (User.IsInRole("CHD") || (User.Identity.Name == offer.AuthorName && offer.Authorized == true))
            {
                UploadButton.Visible = true;
            }


            if (offer.Authorized == false)
            {
                AuthorizationButton.Text = "允许";
            }
            else
            {
                AuthorizationButton.Text = "不允许";
            }

            UserLink.Text = offer.AuthorName;
            CreateDateTimeLabel.Text = offer.CreateDateTime.ToString();
            TitleLabel.Text = offer.Title;
            SubTitleLabel.Text = offer.SubTitle;
            TypeLabel.Text = offer.Ttype.Tname;

            BodyLabel.Text = offer.Body;
        }
    }

    protected void AuthorizationButton_Click(object sender, EventArgs e)
    {
        OfferTorrent offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
        if (offer.Authorized == false)
        {
            offer.Authorized = true;
            AuthorizationButton.Text = "不允许";
            myEntities.SaveChanges();
            return;
        }
        else
        {
            offer.Authorized = false;
            AuthorizationButton.Text = "允许";
            myEntities.SaveChanges();
            return;
        }
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            OfferTorrent offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
            myEntities.OfferTorrents.Remove(offer);
            myEntities.SaveChanges();
            Response.Redirect(string.Format("~/NavigationViews/Offers.aspx"));
        }
    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            Response.Redirect(string.Format("~/TorrentView/OfferAddEdit.aspx?Id={0}", _id));
        }
    }

    protected void UserLink_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            var userId = (from o in myEntities.OfferTorrents
                          join u in myEntities.Users on o.AuthorName equals u.UserName
                          where o.Id == _id
                          select u.UID).Single();
            Response.Redirect(string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userId));
        }
    }

    protected void UploadButton_Click(object sender, EventArgs e)
    {
        try
        {
            OfferTorrent offer = myEntities.OfferTorrents.Where(o => o.Id == _id).Single();
            Torrent torrent = new Torrent();
            torrent.TypeId = offer.TypeId;
            torrent.Title = offer.Title;
            torrent.SubTitle = offer.SubTitle;
            torrent.CreateDateTime = offer.CreateDateTime;
            torrent.UpdateDateTime = offer.UpdateDateTime;
            torrent.Body = offer.Body;
            torrent.AuthorName = offer.AuthorName;
            torrent.TorrentFileUrl = offer.TorrentFileUrl;
            myEntities.Torrents.Add(torrent);
            myEntities.OfferTorrents.Remove(offer);
            myEntities.SaveChanges();

            Response.Redirect(string.Format("~/TorrentView/TorrentDetails.aspx?Id={0}", torrent.Id));
        }
        catch (DbEntityValidationException ex)
        {
            StringBuilder errors = new StringBuilder();
            IEnumerable<DbEntityValidationResult> validationResult = ex.EntityValidationErrors;
            foreach (DbEntityValidationResult result in validationResult)
            {
                ICollection<DbValidationError> validationError = result.ValidationErrors;
                foreach (DbValidationError err in validationError)
                {
                    errors.Append(err.PropertyName + ":" + err.ErrorMessage + "\r\n");
                }
            }
            ErrorSubmitTable.Visible = true;
            ErrorSubmit.Text = errors.ToString();
        }
    }
}