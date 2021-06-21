<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="OrderManager.aspx.cs" Inherits="BooksStore.OrderManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .Hide{
            display:none;
        }
        .btn-gradient
{
	width:36px;
	height:36px;
	text-align:center;
	line-height:2.2;
	display:block;
	margin:10px;
	border-radius:2px;
	-webkit-transition:all 300ms;
	transition:all 300ms
}
.btn-gradient i
{font-size:18px; line-height:1;vertical-align:middle}
#light
{
	margin:20px;
	display:-webkit-box;
	display:-ms-flexbox;
	display:flex;
	-webkit-box-align:center;
	-ms-flex-align:center;
	align-items:center;
	-webkit-box-pack:center;
	-ms-flex-pack:center;
	justify-content:center;
	-webkit-box-orient:vertical;
	-webkit-box-direction:normal;
	-ms-flex-direction:column;
	flex-direction:column
}
#light .btn-gradient
{
	color:rgba(0,0,0,0.54);
	box-shadow:0 0 1px rgba(0,0,0,0.54)
}
@keyframes Gradient {
	0%
	{background-position:0 50%}
	50%
	{background-position:100% 50%}
	100%
	{background-position:0 50%}
}
#light .btn-gradient.instagram:hover
{
	box-shadow:0 5px 8px rgba(63,81,181,0.25);
	background:#FFC107;
	background:-webkit-linear-gradient(left,#FFC107 0%,#F50057 50%,#3F51B5 100%);
	background:linear-gradient(to right,#FFC107 0%,#F50057 50%,#3F51B5 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#FFC107',endColorstr='#3F51B5',GradientType=1);
	background-size:400%;
	-webkit-animation:Gradient 5s ease infinite;
	animation:Gradient 5s ease infinite
}
      

.float {
    position: absolute;
    z-index: 2;
            top: 208px;
            right: 130px;
        }

.form {
    margin-left: 145px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
  

    <asp:Label ID="Label2" runat="server" Text="הזמנות מתאריך"  Width="200" Style="float:right; margin-right:5px; margin-top:5px"></asp:Label>
    <asp:TextBox ID="TextBox1" runat="server" Width="200" Style="float:right; margin-right:5px; margin-top:5px;" placeholder="DD/MM/YYYY"></asp:TextBox>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="שים לב, התאריך לא נכון" Style="color:red"  ControlToValidate="TextBox1" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>                        
    <asp:Label ID="Label3" runat="server" Text="עד לתאריך"  Width="200" Style="float:right; margin-right:5px; margin-top:5px"></asp:Label>
    <asp:TextBox ID="TextBox2" runat="server" Width="200" Style="float:right; margin-right:5px; margin-top:5px; margin-bottom:5px" placeholder="DD/MM/YYYY"></asp:TextBox>
     <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="שים לב, התאריך לא נכון" Style="color:red" ControlToValidate="TextBox2" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>                        
    <asp:LinkButton ID="LinkButton1" runat="server" class="btn-gradient instagram" Text="חפש" Style="float:right; margin-right:5px; margin-top:5px; margin-bottom:5px" OnClick="Button1_Click"><i class="fa fa-search" ></i></asp:LinkButton>
<div class="fixed">  <p><b><a href="OrderStatus.aspx" class="btn btn-outline-info btn-rounded waves-effect"  style="margin:15px; text-decoration: underline; font-size: 18px">לקבלת סטטוס הזמנה לפי קוד הזמנה</a></b></p> </div>
    <br />
    <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align:right" Width="1053px" AutoGenerateColumns="False">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
          <asp:BoundField DataField="ID" HeaderText="קוד הזמנה"/>
            <asp:BoundField DataField="FullName" HeaderText="שם" />
            <asp:BoundField DataField="Hour" HeaderText="שעת הזמנה" DataFormatString="{0:t}" />
            <asp:BoundField DataField="Date1" HeaderText=" תאריך הזמנה[DD/MM/YYYY] " DataFormatString="{0:dd/MM/yyyy}" />
            <asp:BoundField DataField="City" HeaderText="עיר" />
            <asp:BoundField DataField="Address" HeaderText="כתובת" />
            <asp:BoundField DataField="Phone" HeaderText="טלפון" />
            <asp:BoundField DataField="More" HeaderText="הערות של הלקוח" />
            <asp:BoundField DataField="DelieveryPrice" HeaderText="מחיר משלוח" />

            
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
