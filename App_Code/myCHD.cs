﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Collections.Generic;

public partial class Application
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Application()
    {
        this.Memberships = new HashSet<Membership>();
        this.Roles = new HashSet<Role>();
        this.Users = new HashSet<User>();
    }

    public System.Guid ApplicationId { get; set; }
    public string ApplicationName { get; set; }
    public string Description { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Membership> Memberships { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Role> Roles { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<User> Users { get; set; }
}

public partial class Forum
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Forum()
    {
        this.ViewForums = new HashSet<ViewForum>();
    }

    public int Id { get; set; }
    public string ForumName { get; set; }
    public string ForumDescription { get; set; }
    public string Moderator { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<ViewForum> ViewForums { get; set; }
}

public partial class ForumReply
{
    public int Id { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public System.DateTime UpdateDateTime { get; set; }
    public string ReplyContent { get; set; }
    public int ViewForumId { get; set; }
    public string UserName { get; set; }

    public virtual ViewForum ViewForum { get; set; }
}

public partial class Membership
{
    public System.Guid UserId { get; set; }
    public System.Guid ApplicationId { get; set; }
    public string Password { get; set; }
    public int PasswordFormat { get; set; }
    public string PasswordSalt { get; set; }
    public string Email { get; set; }
    public string PasswordQuestion { get; set; }
    public string PasswordAnswer { get; set; }
    public bool IsApproved { get; set; }
    public bool IsLockedOut { get; set; }
    public System.DateTime CreateDate { get; set; }
    public System.DateTime LastLoginDate { get; set; }
    public System.DateTime LastPasswordChangedDate { get; set; }
    public System.DateTime LastLockoutDate { get; set; }
    public int FailedPasswordAttemptCount { get; set; }
    public System.DateTime FailedPasswordAttemptWindowStart { get; set; }
    public int FailedPasswordAnswerAttemptCount { get; set; }
    public System.DateTime FailedPasswordAnswerAttemptWindowsStart { get; set; }
    public string Comment { get; set; }

    public virtual Application Application { get; set; }
    public virtual User User { get; set; }
}

public partial class OfferTorrent
{
    public int Id { get; set; }
    public int TypeId { get; set; }
    public string Title { get; set; }
    public string SubTitle { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public string Body { get; set; }
    public System.DateTime UpdateDateTime { get; set; }
    public string AuthorName { get; set; }
    public bool Authorized { get; set; }
    public string TorrentFileUrl { get; set; }

    public virtual Ttype Ttype { get; set; }
}

public partial class Profile
{
    public System.Guid UserId { get; set; }
    public string PropertyNames { get; set; }
    public string PropertyValueStrings { get; set; }
    public byte[] PropertyValueBinary { get; set; }
    public System.DateTime LastUpdatedDate { get; set; }

    public virtual User User { get; set; }
}

public partial class Role
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Role()
    {
        this.Users = new HashSet<User>();
    }

    public System.Guid RoleId { get; set; }
    public System.Guid ApplicationId { get; set; }
    public string RoleName { get; set; }
    public string Description { get; set; }

    public virtual Application Application { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<User> Users { get; set; }
}

public partial class Torrent
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Torrent()
    {
        this.TorrentComments = new HashSet<TorrentComment>();
    }

    public int Id { get; set; }
    public int TypeId { get; set; }
    public string Title { get; set; }
    public string SubTitle { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public System.DateTime UpdateDateTime { get; set; }
    public string Body { get; set; }
    public string AuthorName { get; set; }
    public string TorrentFileUrl { get; set; }

    public virtual Ttype Ttype { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<TorrentComment> TorrentComments { get; set; }
}

public partial class TorrentComment
{
    public int Id { get; set; }
    public int TorrentId { get; set; }
    public string AuthorName { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public System.DateTime UpdateDateTime { get; set; }
    public string Summary { get; set; }

    public virtual Torrent Torrent { get; set; }
}

public partial class Ttype
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public Ttype()
    {
        this.OfferTorrents = new HashSet<OfferTorrent>();
        this.Torrents = new HashSet<Torrent>();
    }

    public int Id { get; set; }
    public string Tname { get; set; }

    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<OfferTorrent> OfferTorrents { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Torrent> Torrents { get; set; }
}

public partial class User
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public User()
    {
        this.Roles = new HashSet<Role>();
    }

    public System.Guid UserId { get; set; }
    public int UID { get; set; }
    public System.Guid ApplicationId { get; set; }
    public string UserName { get; set; }
    public bool IsAnonymous { get; set; }
    public System.DateTime LastActivityDate { get; set; }
    public System.DateTime CreateDateTime { get; set; }
    public string AvatarUrl { get; set; }
    public int Invite { get; set; }
    public string IPAdress { get; set; }
    public string BtClient { get; set; }
    public int Uploaded { get; set; }
    public int Downloaded { get; set; }
    public double UploadTime { get; set; }
    public double DownloadTime { get; set; }
    public int Bouns { get; set; }
    public int TorrentComment { get; set; }
    public int Forums { get; set; }

    public virtual Application Application { get; set; }
    public virtual Membership Membership { get; set; }
    public virtual Profile Profile { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<Role> Roles { get; set; }
}

public partial class ViewForum
{
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
    public ViewForum()
    {
        this.ForumReplies = new HashSet<ForumReply>();
    }

    public int Id { get; set; }
    public string Title { get; set; }
    public int ViewCount { get; set; }
    public int ReplyCount { get; set; }
    public int ForumId { get; set; }
    public string UserName { get; set; }

    public virtual Forum Forum { get; set; }
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
    public virtual ICollection<ForumReply> ForumReplies { get; set; }
}
