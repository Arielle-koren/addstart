<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="PreviousOrders.aspx.cs" Inherits="BooksStore.PreviousOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 style="text-align:right">ההזמנות שלי</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" style="float:right; text-align:right" Width="1148px">
                <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="Date1" HeaderText="יום" DataFormatString="{0:d}"/>
            <asp:BoundField DataField="Hour" HeaderText="שעה" DataFormatString="{0:t}"/>
            <asp:BoundField DataField="Address" HeaderText="כתובת" />
            <asp:BoundField DataField="S" HeaderText="מספר מוצרים" />
            <asp:BoundField DataField="Total" HeaderText="מחיר לא כולל דמי משלוח (תוספת 10 שקלים)" />
            <asp:BoundField DataField="More" HeaderText="בקשות מיוחדות" />
            <asp:TemplateField>
                <ItemTemplate>
                    <a id="LinkButton1" href="OrderReciept.aspx?data=<%# Eval ("ID") %>">לפירוט חשבון ומצב ההזמנה</a>
                </ItemTemplate>
            </asp:TemplateField>

        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
    <asp:Label ID="Label2" runat="server" Text="" Style="float:right"></asp:Label>
</asp:Content>
