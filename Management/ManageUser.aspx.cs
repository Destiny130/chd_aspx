using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Management_ManageUser : BasePage
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
            var user = myEntities.Users.Where(u => u.UID == _id).Single();
            if (user != null)
            {
                string _userName = user.UserName.ToString();
                UserName.Text = _userName;
                UserName.Visible = true;           //控件的可见性

                ProfileCommon theProfile = Profile.GetProfile("_userName");
                PersonalDesText.Text = theProfile.PersonalDescription;

                UserNameText.Text = user.UserName;
                InviteText.Text = user.Invite.ToString();
                CreateDateText.Text = user.CreateDateTime.ToString();
                LastActivityDateText.Text = user.LastActivityDate.ToString();
                IPAdressText.Text = user.IPAdress;
                BTClientText.Text = user.BtClient;
                UploadedText.Text = user.Uploaded.ToString();
                DownloadedText.Text = user.Downloaded.ToString();
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
                UploadTimeText.Text = user.UploadTime.ToString();
                DownloadTimeText.Text = user.DownloadTime.ToString();
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
                    timeRadio = (user.UploadTime / user.DownloadTime).ToString("#.0000");
                }
                TimeRadioLabel.Text = timeRadio;
                AvatarImg.ImageUrl = user.AvatarUrl;
                //TorrentCommentLabel.Text = (from )  //搜索种子评论数
                ForumsPostLabel.Text = (from f in myEntities.ForumReplies
                                        where f.UserName == _userName
                                        select f).Count().ToString();
                BounsText.Text = user.Bouns.ToString();
            }
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", _id.ToString()));
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        if (_id > -1)
        {
            User user = myEntities.Users.Where(u => u.UID == _id).Single();
            string _userName = user.UserName.ToString();
            ProfileCommon theProfile = Profile.GetProfile("_userName");

            user.UserName = UserNameText.Text;
            user.Invite = Convert.ToInt32(InviteText.Text);
            user.CreateDateTime = Convert.ToDateTime(CreateDateText.Text);
            user.LastActivityDate = Convert.ToDateTime(LastActivityDateText.Text);
            user.IPAdress = IPAdressText.Text;
            user.BtClient = BTClientText.Text;
            user.Uploaded = Convert.ToInt32(UploadedText.Text);
            user.Downloaded = Convert.ToInt32(DownloadedText.Text);
            user.Bouns = Convert.ToInt32(BounsText.Text);
            user.UploadTime = Convert.ToInt32(UploadTimeText.Text);
            user.DownloadTime = Convert.ToInt32(DownloadTimeText.Text);

            FileUpload AvatarFileUpload = (FileUpload)ManagerUserTable.FindControl("AvatarFileUpload");
            if (!AvatarFileUpload.HasFile || !AvatarFileUpload.FileName.ToLower().EndsWith(".jpg"))
            {
                CustomValidator cusValImage = (CustomValidator)ManagerUserTable.FindControl("cusValImage");
                cusValImage.IsValid = false;
                ModelState.AddModelError("Invalid", cusValImage.ErrorMessage);
            }

            if (ModelState.IsValid && Page.IsValid)
            {
                string virtualFolder = "~/Pictures/AvatarPics/";
                string physicalFolder = Server.MapPath(virtualFolder);
                string fileName = AvatarFileUpload.FileName;
                string extension = System.IO.Path.GetExtension(AvatarFileUpload.FileName);

                AvatarFileUpload.SaveAs(System.IO.Path.Combine(physicalFolder, fileName));  //+extension
                user.AvatarUrl = virtualFolder + fileName;                                  //+extension
                myEntities.SaveChanges();
            }

            theProfile.PersonalDescription = PersonalDesText.Text;
            myEntities.SaveChanges();
        }
    }
}