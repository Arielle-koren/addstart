<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="Payment1.aspx.cs" Inherits="BooksStore.payment1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <style>
        a {color:#696969;}
img {width:100%;}
.twhite {color:#fff!important;}
.twhite a {color:#fff!important;}
/************* Background ****************/
.bglight1 {background:#f2f2f2;}
/************* TOP-HEAD *****************/
.top-head ul li {padding-right:8px;}
/****************** Navigation **************/
.navbar-toggler {border-color: #dd0000;}
.navbar-toggler-icon {
  background-image: url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 32 32' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgb(221, 0, 0, 0.7)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 8h24M4 16h24M4 24h24'/%3E%3C/svg%3E");
}
/**************** Banner Slider Carousel **************/
.carousel-inner img {width: 100%;}
.carousel-caption {color:#000;top:110px; bottom: auto; text-align:left;}
.carousel-caption h1 { color:#dd0000;}
/************ Services **************/
.most-car-box:hover {  box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);}
/*********** TABS *******/
.nav-tabs { border-bottom: 1px solid #ccc; }
.nav-tabs .nav-link.active {
    border-bottom: 1px solid #dd0000;
    border-radius:0px;
}
/**************** Social ICONS ***************/

.social-icons{margin: 0;padding: 0; font-size : 8px;}
.social {margin:7px 7px 7px 0px;}
#social-fb:hover {color: #3B5998;transition:all .25s;}
 #social-tw:hover {color: #4099FF;transition:all .25s;}
 #social-gp:hover {color: #d34836;transition:all .25s;}
 #social-em:hover {color: #f39c12;transition:all .25s;}

 body {
    margin-top:40px;
}
.stepwizard-step p {
    margin-top: 10px;
}
.stepwizard-row {
    display: table-row;
}
.stepwizard {
    display: table;
    width: 50%;
    position: relative;
}
.stepwizard-step button[disabled] {
    opacity: 1 !important;
    filter: alpha(opacity=100) !important;
}
.stepwizard-row:before {
    top: 14px;
    bottom: 0;
    position: absolute;
    content: " ";
    width: 100%;
    height: 1px;
    background-color: #ccc;
   
}
.stepwizard-step {
    display: table-cell;
    text-align: center;
    position: relative;
}
.btn-circle {
    width: 30px;
    height: 30px;
    text-align: center;
    padding: 6px 0;
    font-size: 12px;
    line-height: 1.428571429;
    border-radius: 15px;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">

<div class="content py-5  bg-secondary" style="align-content:center;">
<div class="container" ">

    <div class="stepwizard col-md-offset-3" aria-flowto="center">
    <div class="stepwizard-row setup-panel">
      <div class="stepwizard-step">
        <a href="#step-1" type="button" class="btn btn-light btn-circle">1</a>
        <p>פרטי הזמנה</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" >2</a>
        <p>פרטי תשלום</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-3" type="button" class="btn btn-default btn-circle" >3</a>
        <p>אישור הזמנה</p>
      </div>
    </div>
  </div>
	<div class="row">
		<div class="col-md-6 offset-md-3" style="display:inline-block;   max-width: 500px; margin:auto; direction:rtl; text-align:right">
                    <span class="anchor" id="formPayment"></span>
                    <hr class="my-5">

                    <!-- form card cc payment -->
                    <div class="card card-outline-secondary">

                        <div class="card-body">
                            <h3 class="text-center" >השלמת פרטי הזמנה</h3>
                            <hr>

                            <form class="form" role="form">
                                <asp:Label ID="Label2" runat="server" Text="" Font-Bold="true"></asp:Label>
                                <div class="form-group">
                                    <label for="cc_name" style="font-weight:bold;">עיר</label>
                                    <asp:DropDownList ID="City" runat="server" placeholder="עיר" class="form-control" ></asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="שדה חובה" ControlToValidate="City" BackColor="WhiteSmoke" ></asp:RequiredFieldValidator>
                                </div>
                                <div class="form-group">
                                    <label style="font-weight:bold;"> רחוב+ מספר דירה</label>
                                    <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control"  title="הקלד את הכתובת לשם תרצה שההזמנה תישלח" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="שדה חובה" ControlToValidate="TextBox2" BackColor="WhiteSmoke"></asp:RequiredFieldValidator>
                                </div>
                             

                              <div class="form-group">
                                    <label style="font-weight:bold;">טלפון ליצירת קשר</label>
                                    <asp:TextBox ID="TextBox3" runat="server" type="text" class="form-control"  title="הקלד מספר טלפון שיהיה זמין" ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="שדה חובה" ControlToValidate="TextBox3" BackColor="WhiteSmoke"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox3" ValidationExpression="[0-9]{10}" BackColor="WhiteSmoke"></asp:RegularExpressionValidator>
                                </div>
                                      <div class="form-group">
                                    <label style="font-weight:bold;">תרצה/י להוסיף הערות?</label>
                                    <asp:TextBox ID="TextBox4" runat="server" type="text" class="form-control"  title="אנחנו כאן בשבילך!" ></asp:TextBox>
                                </div>

                              
                                <div class="row">
                                    <label class="col-md-12" style="font-weight:bold;">סכום</label>
                                </div>
                                <div class="form-inline">
                                    <div class="input-group">
                                        <div class="input-group-append"><span class="input-group-text">₪</span></div>
                                        <asp:Label ID="Label1" runat="server" Text="" type="text" class="form-control text-right" disabled="disabled" Style=" padding-left: 60px"></asp:Label>
                                        <div class="input-group-prepend"><span class="input-group-text"> </span></div>
                                     </div>
                                </div>
                                <hr>

                                <div class="form-group row">
                                    <div class="col-md-6">
                                        <asp:LinkButton ID="LinkButton1" runat="server" class="btn btn-default btn-lg btn-block" href="Cart.aspx">ביטול</asp:LinkButton>
                                    </div>
                                    <div class="col-md-6">
                                                 <asp:Button ID="Button2" runat="server" Text="להמשך" class="btn btn-success btn-lg btn-block" OnClick="Button2_Click"/>
                                        
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <!-- /form card cc payment -->

                </div>
	</div>
</div>
</div>
</asp:Content>
