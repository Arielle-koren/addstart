﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="MyRequests.aspx.cs" Inherits="BooksStore.MyRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
      body{
          background-image: url("https://s3-eu-west-1.amazonaws.com/schooly/hayovel/news/f_205201293133371212.jpg");
          border-image-width: 500px
      }
        .card-white  .card-heading {
  color: #333;
  background-color: #fff;
  border-color: #ddd;
   border: 1px solid #dddddd;
}
.card-white  .card-footer {
  background-color: #fff;
  border-color: #ddd;
}
.card-white .h5 {
    font-size:14px;
    //font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
.card-white .time {
    font-size:12px;
    //font-family: "Helvetica Neue",Helvetica,Arial,sans-serif;
}
.post .post-heading {
  height: 30px;
  padding: 20px 15px;
}
.post .post-heading .avatar {
  width: 60px;
  height: 60px;
  display: block;
  margin-right: 15px;
}
.post .post-heading .meta .title {
  margin-bottom: 0;
}
.post .post-heading .meta .title a {
  color: black;
}
.post .post-heading .meta .title a:hover {
  color: #aaaaaa;
}
.post .post-heading .meta .time {
  margin-top: 8px;
  color: #999;
}
.post .post-image .image {
  width: 100%;
  height: auto;
}
.post .post-description {
  padding: 15px;
}
.post .post-description p {
  font-size: 14px;
}
.post .post-description .stats {
  margin-top: 20px;
}
.post .post-description .stats .stat-item {
  display: inline-block;
  margin-right: 15px;
}
.post .post-description .stats .stat-item .icon {
  margin-right: 8px;
}
.post .post-footer {
  border-top: 1px solid #ddd;
  padding: 15px;
}
.post .post-footer .input-group-addon a {
  color: #454545;
}
.post .post-footer .comments-list {
  padding: 0;
  margin-top: 20px;
  list-style-type: none;
}
.post .post-footer .comments-list .comment {
  display: block;
  width: 100%;
  margin: 20px 0;
}
.post .post-footer .comments-list .comment .avatar {
  width: 35px;
  height: 35px;
}
.post .post-footer .comments-list .comment .comment-heading {
  display: block;
  width: 100%;
}
.post .post-footer .comments-list .comment .comment-heading .user {
  font-size: 14px;
  font-weight: bold;
  display: inline;
  margin-top: 0;
  margin-right: 10px;
}
.post .post-footer .comments-list .comment .comment-heading .time {
  font-size: 12px;
  color: #aaa;
  margin-top: 0;
  display: inline;
}
.post .post-footer .comments-list .comment .comment-body {
  margin-left: 50px;
}
.post .post-footer .comments-list .comment > .comments-list {
  margin-left: 50px;
}
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <h1 style="float:right; color:black; background-color:white">הבקשות שלי</h1>
    <br />
    <br />
    <
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <center>
       <div class="container" dir="rtl" style="text-align:right">
           <center>
               
    <div class="row">
        <div class="col-8">
            <div class="card card-white post">
                <div class="post-heading">
                    <div class="float-right meta">
                        <div class="title h5">
                            <h5>התאריך שבו בוצעה הבקשה:</h5>
                            <asp:Label ID="Label2" runat="server" Text='<%# Eval ("Date1") %>' DataFormatString="{0:d}"></asp:Label>
                        </div>
                        
                    </div>
                </div> 
                <div class="post-description"> 
                                                <h5>תוכן הבקשה:</h5>

                    <p><asp:Label ID="Label3" runat="server" Text='<%# Eval ("Content") %>'></asp:Label></p>
                 <br />
                   <asp:Label ID="Label4" runat="server" Text="בקשה נענתה" Visible='<%# Eval ("Done") %>' Font-Bold="true"></asp:Label>
                <asp:Button ID="Button1" runat="server" Text="במידה ואתה מרגיש שהבקשה לא נענתה כראוי לחץ כאן והבקשה תועבר בשנית" CommandName='<%# Eval ("ID") %>' OnClick="Button1_Click" Visible='<%# Eval ("Done") %>'></asp:Button>
                
                    </div>
            </div>
        </div>
        
    </div>
               </center>
</div>
</center>
            </ItemTemplate>
    </asp:Repeater>
    <asp:Label ID="Label2" runat="server" Text="" Style="background-color:white; float:right"></asp:Label>

</asp:Content>