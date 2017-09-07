using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Web.ModelBinding;
using System.Web.Security;
using System.Data;

public partial class NavigationViews_TorrentDetails : BasePage
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
            TorrentDetailsTable.Visible = true;
            Torrent torrent = myEntities.Torrents.Where(t => t.Id == _id).Single();
            if (User.IsInRole("CHD") || User.Identity.Name == torrent.AuthorName)
            {
                EditButton.Visible = true;
                DeleteButton.Visible = true;
            }

            UserLink.Text = torrent.AuthorName;
            CreateDateTimeLabel.Text = torrent.CreateDateTime.ToString();
            TitleLabel.Text = torrent.Title;
            SubTitleLabel.Text = torrent.SubTitle;
            TypeLabel.Text = torrent.Ttype.Tname;
            BodyLabel.Text = torrent.Body;

            DownloadLink.Text = torrent.TorrentFileUrl.Replace("~/TorrentFolder/", "");
        }
    }

    protected void DeleteButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            Torrent torrent = myEntities.Torrents.Where(t => t.Id == _id).Single();
            myEntities.Torrents.Remove(torrent);

            var comments = myEntities.TorrentComments.Where(c => c.TorrentId == _id);
            foreach (var c in comments)
            {
                myEntities.TorrentComments.Remove(c);
            }
            myEntities.SaveChanges();
            Response.Redirect(string.Format("~/NavigationViews/Torrents.aspx"));
        }
    }

    protected void EditButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            Response.Redirect(string.Format("~/NavigationViews/UploadEdit.aspx?Id={0}", _id));
        }
    }

    protected void UserLink_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            var userId = (from t in myEntities.Torrents
                          join u in myEntities.Users on t.AuthorName equals u.UserName
                          where t.Id == _id
                          select u.UID).Single();
            Response.Redirect(string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userId));
        }
    }

    protected void DownLoadButton_Click(object sender, EventArgs e)
    {
        Torrent torrent = myEntities.Torrents.Where(t => t.Id == _id).Single();
        string fileName = torrent.TorrentFileUrl.Replace("~/TorrentFolder/", "");
        string filePath = Server.MapPath(torrent.TorrentFileUrl);

        FileStream fs = new FileStream(filePath, FileMode.Open);
        byte[] bytes = new byte[(int)fs.Length];
        fs.Read(bytes, 0, bytes.Length);
        fs.Close();
        Response.ContentType = "Utorrent/torrent";
        Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlEncode(fileName, System.Text.Encoding.UTF8));
        Response.BinaryWrite(bytes);
        Response.Flush();
        Response.End();
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable CommentList_GetData()
    {
        return myEntities.TorrentComments.Where(c => c.TorrentId == _id);
    }

    public void CommentList_InsertItem()
    {
        TorrentComment comment = new TorrentComment();
        TryUpdateModel(comment);
        if (ModelState.IsValid)
        {
            comment.TorrentId = _id;
            comment.CreateDateTime = DateTime.Now;
            comment.UpdateDateTime = comment.CreateDateTime;
            comment.AuthorName = User.Identity.Name;
            myEntities.TorrentComments.Add(comment);
        }
        myEntities.SaveChanges();
    }

    public void CommentList_DeleteItem(int id)
    {
        TorrentComment comment =
            myEntities.TorrentComments.Where(c => c.Id == id).Single();
        myEntities.TorrentComments.Remove(comment);
        myEntities.SaveChanges();
    }

    protected void CommentList_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        switch (e.Item.ItemType)
        {
            case ListViewItemType.DataItem:
                {
                    TorrentComment comment = (TorrentComment)e.Item.DataItem;
                    User user = myEntities.Users.Where(u => u.UserName == comment.AuthorName).Single();
                    HyperLink authorLink = e.Item.FindControl("AuthorLink") as HyperLink;
                    if (authorLink != null)
                    {
                        authorLink.NavigateUrl = "~/UserDetailsViews/UserDetails.aspx?Id=" + user.UID;
                    }

                    Image avatarImg = e.Item.FindControl("AvatarImg") as Image;
                    if (avatarImg != null)
                    {
                        avatarImg.ImageUrl = user.AvatarUrl;
                    }

                    if (User.IsInRole("CHD") || User.Identity.Name == comment.AuthorName)
                    {
                        Button deleteButton = e.Item.FindControl("DeleteCommentButton") as Button;
                        if (deleteButton != null)
                        {
                            deleteButton.Visible = true;
                        }
                    }
                }
                break;
        }
    }


}