using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Web.Security;

public partial class NavigationViews_Usercp : System.Web.UI.Page
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {
        string userName = User.Identity.Name;
        ProfileCommon theProfile = Profile.GetProfile("userName");

        User user = myEntities.Users.Where(u => u.UserName == userName).Single();

        CreateDateTimeLabel.Text = user.CreateDateTime.ToString();
        IPAdressLabel.Text = user.IPAdress;
        AvatarImg.ImageUrl = user.AvatarUrl;
        InviteLabel.Text = user.Invite.ToString();
        BounsLabel.Text = user.Bouns.ToString();
        TorrentCommentLabel.Text = "0";
        int forumReplyTotal = myEntities.ForumReplies.Count();
        int myForumReplyCount = myEntities.ForumReplies.Where(f => f.UserName == userName).Count();
        ForumPostLabel.Text = myForumReplyCount.ToString();
        ForumReplyTotal.Text = forumReplyTotal.ToString();
        if (forumReplyTotal > 0)
        {
            decimal percent = ((decimal)myForumReplyCount / forumReplyTotal)*100 ;
            ForumPostsPercent.Text = percent.ToString("#.00");
        }
        else
        {
            ForumPostsPercent.Text = "0";
        }
    }
}