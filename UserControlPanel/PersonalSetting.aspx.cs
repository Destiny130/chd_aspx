using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Web.Security;

public partial class UserControlPanel_PersonalSetting : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {
        User user = myEntities.Users.Where(u => u.UserName == User.Identity.Name).Single();
        AvatarImg.ImageUrl = user.AvatarUrl;
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        User user = myEntities.Users.Where(u => u.UserName == User.Identity.Name).Single();

        FileUpload AvatarFileUpload = (FileUpload)PersonalSettingTable.FindControl("AvatarFileUpload");
        if (!AvatarFileUpload.HasFile || !AvatarFileUpload.FileName.ToLower().EndsWith(".jpg"))
        {
            CustomValidator cusValImage = (CustomValidator)PersonalSettingTable.FindControl("cusValImage");
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
    }
}