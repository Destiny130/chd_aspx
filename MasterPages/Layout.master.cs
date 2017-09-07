using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.ModelBinding;

public partial class MasterPages_Layout : System.Web.UI.MasterPage
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {
        navtime.Text = DateTime.Now.ToShortTimeString();

        string userName = Page.User.Identity.Name;
        User user = myEntities.Users.Where(u => u.UserName == userName).Single();
        myBouns.Text = user.Bouns.ToString();
        Invite.Text = user.Invite.ToString();
        Uploaded.Text = user.Uploaded.ToString();
        Downloaded.Text = user.Downloaded.ToString();
        decimal radio;
        if (user.Downloaded == 0 && user.Uploaded == 0)
        {
            Radio.Text = "none";
        }
        else if (user.Downloaded == 0 && user.Uploaded != 0)
        {
            Radio.Text = "∞";
        }
        else
        {
            radio = ((decimal)user.Uploaded / user.Downloaded);
            Radio.Text = radio.ToString("#.00");
        }
    }

    protected void UserLink_Click(object sender, EventArgs e)
    {
        int UID = myEntities.Users.Where(u => u.UserName == Page.User.Identity.Name).Select(u => u.UID).Single();
        Response.Redirect(string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", UID));
    }
}
