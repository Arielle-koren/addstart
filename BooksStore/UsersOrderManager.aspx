<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="UsersOrderManager.aspx.cs" Inherits="BooksStore.UsersOrderManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Hide{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <asp:gridview ID="GridView1" runat="server" AutoGenerateColumns="False" style="text-align:right" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:BoundField DataField="Date1" HeaderText="יום" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Hour" HeaderText="שעה" DataFormatString="{0:t}"/>
            <asp:BoundField DataField="Address" HeaderText="תאריך" />
            <asp:BoundField DataField="S" HeaderText="מספר מוצרים" />
            <asp:BoundField DataField="Total" HeaderText="תשלום" />
            <asp:BoundField DataField="Phone" HeaderText="טלפון ליצירת קשר" />
            <asp:BoundField DataField="More" HeaderText="בקשות הלקוח" />
            <asp:BoundField DataField="ID" >
            <ItemStyle CssClass="Hide" />
            </asp:BoundField>
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
    </asp:gridview>
    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
</asp:Content>
