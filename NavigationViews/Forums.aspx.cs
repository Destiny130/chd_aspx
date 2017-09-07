using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;
using System.Data;

public partial class Views_Fourms : BasePage
{
    myCHDEntities1 myEntities = new myCHDEntities1();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.IsInRole("CHD"))
        {
            NewForumButton.Visible = true;
            EditForumButton.Visible = true;
        }
    }


    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable<Forum> GridView1_GetData()
    {
        return myEntities.Fora;
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        switch (e.Row.RowType)
        {
            case DataControlRowType.DataRow:
                {
                    Forum forum = (Forum)e.Row.DataItem;
                    List<ViewForum> topic = myEntities.ViewForums.Where(v => v.ForumId == forum.Id).ToList();
                    Label topicCount = e.Row.FindControl("TopicCount") as Label;
                    if (topicCount != null)
                    {
                        topicCount.Text = topic.Count().ToString();
                    }
                    Label replyCount = e.Row.FindControl("ReplyCount") as Label;
                    if (replyCount != null)
                    {
                        List<int> topicIdList = topic.Select(v => v.Id).ToList();
                        int number = 0;
                        foreach (var topicId in topicIdList)
                        {
                            number += myEntities.ForumReplies.Where(f => f.ViewForumId == topicId).Count();
                        }
                        replyCount.Text = number.ToString();
                    }

                    try
                    {
                        ForumReply lastReply = myEntities.ForumReplies.Where(f => f.ViewForum.ForumId == forum.Id).OrderByDescending(f => f.CreateDateTime).Take(1).Single();

                        LinkButton lastReplyTopic = e.Row.FindControl("LastReplyTopic") as LinkButton;
                        if (lastReplyTopic != null && lastReply != null)
                        {
                            lastReplyTopic.Text = lastReply.ViewForum.Title;
                            lastReplyTopic.PostBackUrl = "~/Forums/ViewTopic.aspx?Id=" + lastReply.ViewForumId;
                        }
                        Label lastReplyTime = e.Row.FindControl("LastReplyTimeLabel") as Label;
                        if (lastReplyTime != null)
                        {
                            lastReplyTime.Text = lastReply.CreateDateTime.ToString();
                        }

                        LinkButton lastReplyUserLink = e.Row.FindControl("LastReplyUserLink") as LinkButton;
                        if (lastReplyUserLink != null)
                        {
                            lastReplyUserLink.Text = lastReply.UserName;
                            int userId = myEntities.Users.Where(u => u.UserName == lastReply.UserName).Select(u => u.UID).Single();
                            lastReplyUserLink.PostBackUrl = "~/UserDetailsViews/UserDetails.aspx?Id=" + userId;
                        }
                    }
                    catch { }
                    int moderatorId = 0;
                    try
                    {
                        moderatorId = myEntities.Users.Where(u => u.UserName == forum.Moderator).Select(u => u.UID).Single();
                    }
                    catch { }
                    LinkButton moderatorLink = e.Row.FindControl("ModeratorLink") as LinkButton;
                    if (moderatorLink != null)
                    {
                        moderatorLink.PostBackUrl = "~/UserDetailsViews/UserDetails.aspx?Id=" + moderatorId;
                    }
                }
                break;
        }
    }
}