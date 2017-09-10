using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data;
using System.Web.Security;

public partial class Forums_ViewTopic : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();
    int _id = -1;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString.Get("Id")))
        {
            _id = Convert.ToInt32(Request.QueryString.Get("Id"));
        }
        if (_id > -1)
        {
            ViewForum viewForum = myEntities.ViewForums.Where(v => v.Id == _id).Single();
            ForumNameLabel.Text = " --> " + myEntities.Fora.Where(f => f.Id == viewForum.ForumId).Select(f => f.ForumName).Single();

            TopicTitleLabel.Text = " --> " + viewForum.Title.ToString();
            viewForum.ViewCount++;
            myEntities.SaveChanges();
            ViewCountLabel.Text = viewForum.ViewCount.ToString();
        }
        else
        {
            countAndNewTopic.Visible = false;
            ListView1.Visible = false;
            ForumNameLabel.Visible = false;
            TopicTitleLabel.Visible = false;
            noTopic.Visible = true;
        }


        if (Request.IsAuthenticated)
        {
            NewReplyButton.Visible = true;
        }
    }

    protected string GetForumURL()
    {
        int b = (from v in myEntities.ViewForums
                 join f in myEntities.Fora on v.ForumId equals f.Id
                 where v.Id == _id
                 select f.Id).Take(1).SingleOrDefault();
        string ForumURL = string.Format("ViewForum.aspx?Id={0}", b);
        return ForumURL;

    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable ListView1_GetData()
    {
        return myEntities.ForumReplies.Where(f => f.ViewForumId == _id);
    }

    protected string GetAuthorInfo(string UserName)
    {
        int AuthorId = myEntities.Users.Where(u => u.UserName == UserName).Select(u => u.UID).Single();
        return string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", AuthorId);
    }

    protected int GetFloor(int Id)
    {
        int[] RepliesIdList = myEntities.ForumReplies.Where(f => f.ViewForumId == _id).Select(f => f.Id).ToArray();
        int c = Array.IndexOf(RepliesIdList, Id) + 1;
        return c;
    }

    protected void ListView1_PreRender(object sender, EventArgs e)
    {
        TableRow replyRow = ListView1.InsertItem.FindControl("ReplyRow") as TableRow;
        TableRow loginRow = ListView1.InsertItem.FindControl("LoginRow") as TableRow;
        if (Request.IsAuthenticated)
        {
            if (replyRow != null)
            {
                replyRow.Visible = true;
            }
            if (loginRow != null)
            {
                loginRow.Visible = false;
            }
        }
    }

    public void ListView1_InsertItem()
    {
        var forumReply = new ForumReply();
        TryUpdateModel(forumReply);
        if (ModelState.IsValid)
        {
            // Save changes here
            forumReply.ViewForumId = _id;
            forumReply.CreateDateTime = DateTime.Now;
            forumReply.UpdateDateTime = DateTime.Now;
            forumReply.UserName = User.Identity.Name;
            myEntities.ForumReplies.Add(forumReply);
        }
        myEntities.SaveChanges();
    }

    // The id parameter name should match the DataKeyNames value set on the control
    public void ListView1_DeleteItem(int id)
    {
        var forumReply = myEntities.ForumReplies.Where(f => f.Id == _id).Single();
        myEntities.ForumReplies.Remove(forumReply);
        myEntities.SaveChanges();
    }

    protected void ListView1_ItemDataBound(object sender, ListViewItemEventArgs e)
    {
        int[] RepliesIdList = myEntities.ForumReplies.Where(f => f.ViewForumId == _id).Select(f => f.Id).ToArray();
        int c = Array.IndexOf(RepliesIdList, (DataBinder.Eval(e.Item.DataItem, "Id"))) + 1;
        Button editButton = e.Item.FindControl("EditButton") as Button;
        Button editTopicButton = e.Item.FindControl("EditTopicButton") as Button;
        Button deleteButton = e.Item.FindControl("DeleteButton") as Button;
        Button deleteTopicButton = e.Item.FindControl("DeleteTopicButton") as Button;
        Button quoteButton = e.Item.FindControl("QuoteButton") as Button;
        //TableRow replyTableRow = e.Item.FindControl("ReplyTableRow") as TableRow;
        //TableRow loginRow = e.Item.FindControl("LoginRow") as TableRow;
        int forumReplyId = Convert.ToInt32(((Button)editButton).CommandArgument);
        string userName = (from f in myEntities.ForumReplies
                           join u in myEntities.Users on f.UserName equals u.UserName
                           where f.Id == forumReplyId
                           select u.UserName).Single();

        switch (e.Item.ItemType)
        {
            case ListViewItemType.DataItem:
                if (c == 1 && (Roles.IsUserInRole("CHD") || User.Identity.Name == userName))
                {
                    if (editTopicButton != null)
                    {
                        editTopicButton.Visible = true;
                    }

                    if (deleteTopicButton != null)
                    {
                        deleteTopicButton.Visible = true;
                    }
                }
                else if (c != 1 && (Roles.IsUserInRole("CHD") || User.Identity.Name == userName))
                {
                    if (editButton != null)
                    {
                        editButton.Visible = true;
                    }
                    if (deleteButton != null)
                    {
                        deleteButton.Visible = true;
                    }
                }
                if (Request.IsAuthenticated)
                {
                    if (quoteButton != null)
                    {
                        quoteButton.Visible = true;
                    }
                }
                break;
        }
    }

    protected void DeleteTopicButton_Click(object sender, EventArgs e)
    {
        //删除id为fourmid的viewforum项（viewforum的项）
        //然后删除id为forumid的所有
        //ViewForum viewForum = new ViewForum();
        int viewForumId = Convert.ToInt32(((Button)sender).CommandArgument);
        var viewForum = myEntities.ViewForums.Where(v => v.Id == viewForumId).Single();
        myEntities.ViewForums.Remove(viewForum);

        var forumReplies = myEntities.ForumReplies.Where(f => f.ViewForumId == viewForumId).ToList();
        foreach (var forumReply in forumReplies)
        {
            myEntities.ForumReplies.Remove(forumReply);
        }

        myEntities.SaveChanges();

        //删除后重定向到ViewF页面
        int id = myEntities.Fora.Where(f => f.Id == viewForum.ForumId).Select(f => f.Id).Single();
        Response.Redirect(string.Format("~/Forums/ViewForum.aspx?Id={0}", id));
    }

    public string GetAvatarUrl(string userName)
    {
        return myEntities.Users.Where(u => u.UserName == userName).Select(u => u.AvatarUrl).Single();
    }

    protected string GetForumPost(string userName)
    {
        return (from u in myEntities.Users
                join f in myEntities.ForumReplies on u.UserName equals f.UserName
                where u.UserName == userName
                select f).Count().ToString();
    }

    protected string GetUserUploaded(string userName)
    {
        return myEntities.Users.Where(u => u.UserName == userName).Select(u => u.Uploaded).Single().ToString() + "GB";
    }

    protected string GetUserDownloaded(string userName)
    {
        return myEntities.Users.Where(u => u.UserName == userName).Select(u => u.Downloaded).Single().ToString() + "GB";
    }

    protected string GetUserRadio(string userName)
    {
        User user = myEntities.Users.Where(u => u.UserName == userName).Single();
        var a = user.Uploaded;
        var b = user.Downloaded;
        if (a == 0 && b == 0)
        {
            return "0";
        }
        else if (a != 0 && b == 0)
        {
            return "∞";
        }
        else
        {
            return (a / b).ToString();
        }
    }

    protected string GetUserBouns(string userName)
    {
        return myEntities.Users.Where(u => u.UserName == userName).Select(u => u.Bouns).Single().ToString();
    }

    protected void NewReplyButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("ForumReply.aspx?Id={0}", _id));
    }
}