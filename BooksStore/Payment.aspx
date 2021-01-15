﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="BooksStore.Payment" %>
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
.carousel-caption h1 { color:#dd0000; background-color:#;}
/************ Services **************/
.most-car-box:hover {background: ; box-shadow: 0 3px 6px rgba(0,0,0,0.16), 0 3px 6px rgba(0,0,0,0.23);}
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


    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">





<div class="content py-5  bg-secondary" style="align-content:center;">
<div class="container" ">
	<div class="row">
		<div class="col-md-6 offset-md-3" style="display:inline-block;   max-width: 500px; margin:auto; direction:rtl; text-align:right">
                    <span class="anchor" id="formPayment"></span>
                    <hr class="my-5">

                    <!-- form card cc payment -->
                    <div class="card card-outline-secondary">
                        <div class="card-body">
                            <h3 class="text-center" >תשלום כרטיס אשראי</h3>
                            <hr>

                            <form class="form" role="form" autocomplete="off">
                                <div class="form-group">
                                    <label for="cc_name" style="font-weight:bold;">שם בעל הכרטיס</label>
                                    <asp:TextBox ID="TextBox1" runat="server" type="text" class="form-control" title="שם פרטי ושם משפחה"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="שדה חובה" ControlToValidate="TextBox1" BackColor="WhiteSmoke" ></asp:RequiredFieldValidator>
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox1" ValidationExpression="^[אבגדהוזחטיכלמנסעפצקרשתץףןם]+(?:\s[אבגדהוזחטיכלמנסעפצקרשתץףןם]+)+$" BackColor="WhiteSmoke"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group">
                                    <label style="font-weight:bold;">מספר כרטיס</label>
                                    <asp:TextBox ID="TextBox2" runat="server" type="text" class="form-control" autocomplete="off"  ></asp:TextBox>
                                   <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="שדה חובה" ControlToValidate="TextBox2" BackColor="WhiteSmoke"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox2" ValidationExpression="\d{16}" BackColor="WhiteSmoke"></asp:RegularExpressionValidator>
                                </div>
                                <div class="form-group row">
                                    <label class="col-md-12" style="font-weight:bold;">תאריך תפוגה</label>
                                     <div class="col-md-4">
                                     <asp:DropDownList ID="DropDownList1" runat="server" name="cc_exp_mo" size="0" style="font-size: 20px; padding: 5px 10px; border-radius: 5px 12px;">
                                         <asp:ListItem Value="01">01</asp:ListItem>
                                         <asp:ListItem Value="02">02</asp:ListItem>
                                         <asp:ListItem Value="03">03</asp:ListItem>
                                         <asp:ListItem Value="04">04</asp:ListItem>
                                         <asp:ListItem Value="05">05</asp:ListItem>
                                         <asp:ListItem Value="06">06</asp:ListItem>
                                         <asp:ListItem Value="07">07</asp:ListItem>
                                         <asp:ListItem Value="08">08</asp:ListItem>
                                         <asp:ListItem Value="09">09</asp:ListItem>
                                         <asp:ListItem Value="10">10</asp:ListItem>
                                         <asp:ListItem Value="11">11</asp:ListItem>
                                         <asp:ListItem Value="12">12</asp:ListItem>

                                     </asp:DropDownList>

                                    </div>
                                    <div class="col-md-4">
                                   
                                    <asp:DropDownList ID="DropDownList2" runat="server" name="cc_exp_yr" size="0" style="font-size: 20px; padding: 5px 10px; border-radius: 5px 12px;">
                                        <asp:ListItem Value="2018">2018</asp:ListItem>
                                        <asp:ListItem Value="2019">2019</asp:ListItem>
                                        <asp:ListItem Value="2020">2020</asp:ListItem>
                                        <asp:ListItem Value="2021">2021</asp:ListItem>
                                        <asp:ListItem Value="2022">2022</asp:ListItem>
                                    </asp:DropDownList>
                                    </div>
                                   
                                    <div class="col-md-4">
                                         <asp:TextBox ID="TextBox3" runat="server"  type="text" class="form-control" autocomplete="off" placeholder="CVC" title="3 ספרות מאחורי הכרטיס"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="שדה חובה" ControlToValidate="TextBox3" BackColor="WhiteSmoke"></asp:RequiredFieldValidator>
                                         <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox3" ValidationExpression="\d{3}" BackColor="WhiteSmoke"></asp:RegularExpressionValidator>
                                      
                                    </div>
                                    

                                </div>
                                <div class="row">
                                    <label class="col-md-12" style="font-weight:bold;">סכום</label>
                                </div>
                                <div class="form-inline">
                                    <div class="input-group">
                                        <div class="input-group-append"><span class="input-group-text">₪</span></div>
                                        <asp:Label ID="Label1" runat="server" Text="39" type="text" class="form-control text-right"  placeholder="39" disabled="disabled" Style=" padding-left: 60px"></asp:Label>
                                        <div class="input-group-prepend"><span class="input-group-text"> </span></div>
                                     </div>
                                </div>
                                <hr>
                                <div class="form-group row">
                                    <div class="col-md-6">
                                             <asp:Button ID="Button1" runat="server" Text="ביטול" class="btn btn-default btn-lg btn-block"/>    
                                    </div>
                                    <div class="col-md-6">
                                                 <asp:Button ID="Button2" runat="server" Text="הזמנה" class="btn btn-success btn-lg btn-block"/>
                                        
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