<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="OrderStatus.aspx.cs" Inherits="BooksStore.OrderStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        div.fixed {
  position: fixed !important; 
  bottom: 30px;
  left: 30px;
  width: 300px !important;
  z-index:10;
    }
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="fixed">  <p><b><a href="OrderManager.aspx" class="btn btn-outline-info btn-rounded waves-effect"  style="margin:15px; text-decoration: underline; font-size: 18px">חזרה לרשימת ההזמנות</a></b></p> </div>

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
                            <br>
                            <asp:Label ID="Label4" runat="server" Text="" style="font-size:30px"></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
           </center>
    </div>


</asp:Content>
