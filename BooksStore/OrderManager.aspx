<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="OrderManager.aspx.cs" Inherits="BooksStore.OrderManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Hide{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <asp:DropDownList ID="Month" runat="server" Width="100" Style="float:right; margin-right:5px; margin-top:5px"></asp:DropDownList>
    <asp:DropDownList ID="Year" runat="server" Width="100" Style="float:right; margin-right:5px; margin-top:5px"></asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="חפש"  OnClick="Button1_Click" Style="float:right; margin-right:5px; margin-top:5px"/>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align:right" Width="1053px">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
          
            <asp:BoundField DataField="FullName" HeaderText="שם" />
            <asp:BoundField DataField="Hour" HeaderText="שעת הזמנה" DataFormatString="{0:t}" />
            <asp:BoundField DataField="Date1" HeaderText="תאריך הזמנה" DataFormatString="{0:d}" />
            <asp:BoundField DataField="City" HeaderText="עיר" />
            <asp:BoundField DataField="Address" HeaderText="כתובת" />
             <asp:BoundField DataField="Phone" HeaderText="כתובת" />
            <asp:BoundField DataField="More" HeaderText="כתובת" />

              <asp:BoundField DataField="ID" >
            <ItemStyle CssClass="Hide" />
            </asp:BoundField>
            <asp:BoundField DataField="UsersID" >
            <ItemStyle CssClass="Hide" />
            </asp:BoundField>
        </Columns>

        
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />

    </asp:GridView>
    <asp:Label ID="Label1" runat="server" Text="" Style="float:right; font-size:x-large; font-family:'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif  "></asp:Label>
</asp:Content>
