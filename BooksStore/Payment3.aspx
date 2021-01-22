<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Payment3.aspx.cs" Inherits="BooksStore.Payment3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
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
    z-order: 0;
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
        <a href="#step-1" type="button" class="btn btn-default btn-circle">1</a>
        <p>פרטי הזמנה</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-2" type="button" class="btn btn-default btn-circle" >2</a>
        <p>פרטי תשלום</p>
      </div>
      <div class="stepwizard-step">
        <a href="#step-3" type="button" class="btn btn-light btn-circle" >3</a>
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
                            <h3 class="text-center" >ההזמנה נקלטה!</h3>
                            <hr>

                            <form class="form" role="form" autocomplete="off">



                              

                       
                                <div class="form-group row">
                                    <div class="col-md-6">
                                             <asp:Button ID="Button1" runat="server" Text="פרטי ההזמנה" class="btn btn-dark btn-lg btn-block" OnClick="Button1_Click"/>
                                    </div>
                                             <div class="col-md-6">
                                        <asp:Button ID="Button4" runat="server" Text="חזרה לדף הבית" class="btn btn-dark btn-lg btn-block" OnClick="Button1_Click"/> 
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
