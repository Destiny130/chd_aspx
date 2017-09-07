using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.ModelBinding;

public partial class Forums_ViewForum : BasePage
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
            Label5.Text = myEntities.Fora.Where(f => f.Id == _id).Select(f => f.ForumName).Single();
        }
    }
    //要用querystring获取当前页面的id，然后才能进行后期绑定处理

    protected string GetNavigate()
    {
        string thisURL = string.Format("ViewForums.aspx?Id={0}", _id);
        return thisURL;
    }

    protected string GetAuthorURL(string UserName)
    {
        int userUID = myEntities.Users.Where(u => u.UserName == UserName).Select(u => u.UID).Single();
        string returnURL = string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", userUID);
        return returnURL;
    }

    protected string GetReplyCount(object Id)
    {
        string topicString = Id.ToString();
        int topicId = int.Parse(topicString);
        var replyCount = myEntities.ForumReplies.Where(f => f.ViewForumId == topicId).Count();
        return replyCount.ToString();
    }

    protected string GetCreateTime(object Id)
    {
        string topicString = Id.ToString();
        int topicId = int.Parse(topicString);
        var forumReplyCreateTime = myEntities.ForumReplies.Where(f => f.ViewForumId == topicId).OrderBy(f => f.Id).Select(f => f.CreateDateTime).Take(1).Single().ToShortDateString();
        return forumReplyCreateTime;
    }

    protected string GetLastReplyTime(object Id)
    {
        string topicString = Id.ToString();
        int topicId = int.Parse(topicString);
        var lastReplyTime = myEntities.ForumReplies.Where(f => f.ViewForumId == topicId).OrderByDescending(f => f.Id).Select(f => f.CreateDateTime).Take(1).Single().ToShortDateString();
        return lastReplyTime;
    }

    protected string GetLastReplyAuthorName(object Id)
    {
        string topicString = Id.ToString();
        int topicId = int.Parse(topicString);
        string lastReplyAuthorName = (from f in myEntities.ForumReplies
                                      join u in myEntities.Users on f.UserName equals u.UserName
                                      where f.ViewForumId == topicId
                                      orderby f.Id descending
                                      select u.UserName).Take(1).Single().ToString();
        return lastReplyAuthorName;
    }

    protected string GetLastReplyAuthorURL(object Id)
    {
        string topicString = Id.ToString();
        int topicId = int.Parse(topicString);
        var LastReplyAuthorId = (from f in myEntities.ForumReplies
                                 join u in myEntities.Users on f.UserName equals u.UserName
                                 where f.ViewForumId == topicId
                                 orderby f.Id descending
                                 select u.UID).Take(1).Single().ToString();
        return string.Format("~/UserDetailsViews/UserDetails.aspx?Id={0}", LastReplyAuthorId);
    }

    protected void NewTopicButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("~/Forums/NewTopic.aspx?Id={0}", _id));
    }

    // The return type can be changed to IEnumerable, however to support
    // paging and sorting, the following parameters must be added:
    //     int maximumRows
    //     int startRowIndex
    //     out int totalRowCount
    //     string sortByExpression
    public IQueryable<ViewForum> GridView1_GetData()
    {
        return myEntities.ViewForums.Where(v => v.ForumId == _id);
    }
}