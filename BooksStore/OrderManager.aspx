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
      
    .box {
    width: 500px;
    margin: 200px 0;
}

.shape1{
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -50px;
}
.shape2 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
}
.shape3 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
    margin-left: -31px;
}
.shape4 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -25px;
    float: left;
    margin-left: -32px;
}
.shape5 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -48px;
    margin-left: -32px;
    margin-top: -30px;
}
.shape6 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -35px;
}
.shape7 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -57px;
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
    
    <div class="container">
       <center>
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="box">
                    <div class="shape1"></div>
                    <div class="shape2"></div>
                    <div class="shape3"></div>
                    <div class="shape4"></div>
                    <div class="shape5"></div>
                    <div class="shape6"></div>
                    <div class="shape7"></div>
                    <div class="float">
                        <form class="form" action="">
                            <div class="form-group">
                                <label for="username" class="text-white" style="text-align:right; float:right" >קוד הזמנה:</label><br>
                                <asp:TextBox ID="TextBox3" runat="server" class="form-control"></asp:TextBox>

                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox3" ValidationExpression="^[1-9][0-9]*$"></asp:RegularExpressionValidator>
                            
                            </div>

                            <div class="form-group">
                            <asp:Button ID="Button2" runat="server" Text="חפש סטטוס הזמנה" class="btn btn-info btn-md" OnClick="Button2_Click" Style="float:right"/>
                            </div>
                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
           </center>
    </div>


    
</asp:Content>
