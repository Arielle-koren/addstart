<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="UsersManager.aspx.cs" Inherits="BooksStore.UsersManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hide{
            display:none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="text-align:right; float:right;" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" Height="374px" Width="1297px">
        <AlternatingRowStyle BackColor="#CCCCCC" />
    <Columns>
        
       
       
        <asp:BoundField DataField="Name" HeaderText="שם" />
       
        <asp:BoundField DataField="Email" HeaderText="אימייל" />
        <asp:BoundField DataField="Birthday" HeaderText="תאריך לידה" />
        <asp:BoundField DataField="Pass" HeaderText="סיסמה" />
        <asp:TemplateField HeaderText="מספר הזמנות">
            <ItemTemplate>
                <asp:HyperLink ID="HyperLink1" runat="server" Text='<%# Eval ("Total") %>'></asp:HyperLink>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="מידע נוסף">
            <ItemTemplate>
                <a id="a" href="UsersOrderManager.aspx?data=<%# Eval ("ID") %>"> לצפייה בתיאור ההזמנות</a>
                
                <asp:Label ID="Label1" runat="server" Text='<%# Eval ("ID") %>' CssClass="hide"></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>

    </Columns>

        <FooterStyle BackColor="#CCCCCC" />
        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F1F1F1" />
        <SortedAscendingHeaderStyle BackColor="#808080" />
        <SortedDescendingCellStyle BackColor="#CAC9C9" />
        <SortedDescendingHeaderStyle BackColor="#383838" />

    </asp:GridView>
    
</asp:Content>
