using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class UserControlViews_UserDetails : BasePage
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
            if (User.IsInRole("CHD"))
            {
                ManageUserLink.Visible = true;

            }
            UserDetailsTable.Visible = true;
            noIdChoosen.Visible = false;
            var user = myEntities.Users.Where(u => u.UID == _id).Single();
            if (user != null)
            {
                string _userName = user.UserName.ToString();
                UserName.Text = _userName;
                UserName.Visible = true;
                ProfileCommon theProfile = Profile.GetProfile("_userName");
                PersonalDesLabel.Text = theProfile.PersonalDescription;

                InviteLabel.Text = user.Invite.ToString();
                CreateLabel.Text = user.CreateDateTime.ToString();
                LastActiveLabel.Text = user.LastActivityDate.ToString();
                IPLabel.Text = user.IPAdress;
                BTClientLabel.Text = user.BtClient;
                UploadedLabel.Text = user.Uploaded.ToString();
                DownloadedLabel.Text = user.Downloaded.ToString();
                decimal radio;
                if (user.Downloaded == 0 && user.Uploaded == 0)
                {
                    RadioLabel.Text = "none";
                }
                else if (user.Downloaded == 0 && user.Uploaded != 0)
                {
                    RadioLabel.Text = "∞";
                }
                else
                {
                    radio = ((decimal)user.Uploaded / user.Downloaded);
                    RadioLabel.Text = radio.ToString("#.00");
                }
                TorrentBounsLabel.Text = user.Bouns.ToString();
                UploadTimeLabel.Text = user.UploadTime.ToString();
                DownloadTimeLabel.Text = user.DownloadTime.ToString();
                string timeRadio;
                if (user.UploadTime == 0 && user.DownloadTime == 0)
                {
                    timeRadio = "none";
                }
                else if (user.UploadTime != 0 && user.DownloadTime == 0)
                {
                    timeRadio = "∞";
                }
                else
                {
                    timeRadio = (user.UploadTime / user.DownloadTime).ToString("#.00");
                }
                TimeRadioLabel.Text = timeRadio;
                AvatarImg.ImageUrl = user.AvatarUrl;
                TorrentCommentLabel.Text = myEntities.TorrentComments.Where(c => c.AuthorName == _userName).Count().ToString();
                TorrentCommentLink.PostBackUrl = "~/UserHistory/ViewComments.aspx?Id=" + _id;
                ForumsPostLabel.Text = myEntities.ForumReplies.Where(f => f.UserName == _userName).Count().ToString();
                ForumPostLink.PostBackUrl = "~/UserHistory/ViewPosts.aspx?Id=" + _id;
                BounsLabel.Text = user.Bouns.ToString();

            }
        }
    }

    protected void ManageUserLink_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/Management/ManageUser.aspx?Id={0}", _id.ToString()));
    }
    
}