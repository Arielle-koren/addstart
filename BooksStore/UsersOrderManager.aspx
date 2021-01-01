<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="UsersOrderManager.aspx.cs" Inherits="BooksStore.UsersOrderManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:gridview ID="GridView1" runat="server">
        <Columns>
          
        </Columns>
    </asp:gridview>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</asp:Content>
