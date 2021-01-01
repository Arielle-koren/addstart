<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="AddBooks.aspx.cs" Inherits="BooksStore.AddBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

    .form-control {
    border-radius: 0px;
    color: #6b6c6d;
    font-size: 18px;
    font-weight:600;
    width: 100%;
    height: 52px;
    padding: 0px;
    line-height: 1.42857143;
    border-top: transparent;
    border-left: transparent;
    border-right: transparent;
    border-bottom: 1px solid #cbcfce;
    background-color: transparent;
    text-transform: uppercase;
    letter-spacing: 0px;
    margin-bottom: 10px;
    -webkit-box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
    box-shadow: inset 0 0px 0px rgba(0, 0, 0, .075);
}

.form-control:focus {
    color: #34b2a4 !important;
    outline: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
    border-bottom-color: #34b2a4;
    font-size: 12px;
}

.input-group {
    position: relative;
    display: table;
    border-collapse: separate;
}

input[type=checkbox],
input[type=radio] {
    margin: 8px 0 0;
    margin-top: 12px;
    line-height: normal;
}

input::-webkit-input-placeholder {
    color: #6b6c6d !important;
}

input:focus::-webkit-input-placeholder {
    color: #34b2a4 !important;
    bottom: 20px;
    position: relative;
}

textarea::-webkit-input-placeholder {
    color: #6b6c6d !important;
}

textarea:focus::-webkit-input-placeholder {
    color: #34b2a4 !important;
    bottom: 20px;
    position: relative;
    font-size: 12px;
}



.focus {
    border-top: transparent;
    border-left: transparent;
    border-right: transparent;
    border-bottom: 1px solid #cbcfce;
    background-color: #fff;
}

.focus:focus {
    border-top: transparent;
    border-left: transparent;
    border-right: transparent;
    border-bottom: 1px solid #cbcfce;
    outline: 0;
    -webkit-box-shadow: none;
    box-shadow: none;
}
*[role="form"] {
    max-width: 530px;
    padding: 15px;
    margin: 15px auto;
    border-radius: 0.3em;
    background-color: #f2f2f2;
}

*[role="form"] h2 { 
    font-family: 'Open Sans' , sans-serif;
    font-size: 60px;
    font-weight: 600;
    color: #000000;
    margin-top: 5%;
    text-align: center;
    text-transform: uppercase;
    letter-spacing: 4px;
}



/* Popup container - can be anything you want */
.popup {
  position: relative;
  display: inline-block;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}

/* The actual popup */
.popup .popuptext {
  visibility: hidden;
  width: 160px;
  background-color: #555;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 8px 0;
  position: absolute;
  z-index: 1;
  bottom: 125%;
  left: 50%;
  float:right;
  
}

/* Popup arrow */
.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  
  border-width: 5px;
  border-style: solid;
  border-color: #fff transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 2s;
  animation: fadeIn 2s;
}

/* Add animation (fade in the popup) */
@-webkit-keyframes fadeIn {
  from {opacity: 0;} 
  to {opacity: 1;}
}

@keyframes fadeIn {
  from {opacity: 0;}
  to {opacity:1 ;}
}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="text-align:center">
           
                <h3  class="text-info" style="color: #34b2a4; margin-left:350px; margin-top:10px; font-size:40px; font-family:Arial, Helvetica, sans-serif;">הוספת ספר</h3>
                <div class="form-group" style="margin-bottom:30px;">
                    <div class="col-sm-9" >
                        <asp:TextBox ID="name" type="text" runat="server" text-align=center; placeholder="שם הספר" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="שדה חובה" ControlToValidate="name"></asp:RequiredFieldValidator>
                    </div>
                                    
                </div>
                <div class="form-group"  style="margin-bottom:30px;">
                     <div class="col-sm-9">
                          <asp:TextBox ID="auther" type="text" runat="server" placeholder="סופר" class="form-control" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="שדה חובה" ControlToValidate="auther"></asp:RequiredFieldValidator>
                    </div>
                  
                   
                </div>
                <div class="form-group" style="margin-bottom:30px;">
                      <div class="col-sm-9">
                             <asp:TextBox ID="price" runat="server" placeholder="מחיר" class="form-control"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="שדה חובה" ControlToValidate="price"></asp:RequiredFieldValidator>
                    </div>
                  
                </div>
                <div class="form-group" style="margin-bottom:30px">
                     <div class="col-sm-9">
                         <asp:DropDownList ID="type1" runat="server" placeholder="ז'אנר" class="form-control"></asp:DropDownList>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="שדה חובה" ControlToValidate="type1"></asp:RequiredFieldValidator>
                    </div>

                </div>
                <div class="form-group" style="margin-bottom:30px;">
                       <div class="col-sm-9">
                             <asp:TextBox ID="description" runat="server" placeholder="תיאור" class="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="שדה חובה" ControlToValidate="description"></asp:RequiredFieldValidator>
                    </div>
                    </div>
                 <div class="form-group" style="margin-bottom:30px;">
                       <div class="col-sm-9">
                             <asp:TextBox ID="stock" runat="server" placeholder="מלאי" class="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="שדה חובה" ControlToValidate="stock"></asp:RequiredFieldValidator>
                    </div>
                     </div>

                  <div class="form-group" style="margin-bottom:30px;">
                       <div class="col-sm-9">
                            
                           <asp:FileUpload ID="FileUpload1" runat="server" placeholder="תמונה" class="form-control"/>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="שדה חובה" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                           
                       </div>
                      
       
                  
                </div>
       

                <asp:Button ID="Button1" runat="server" Text="הוסף" class="btn btn-outline-info btn-rounded waves-effect" style="background-color:gray; color:white; margin-right:15px; margin-left:430px; margin-bottom:100px; width:805px;" onClick="Button1_Click"/>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" >
    function ShowPopup(message, tit) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({
                title: "הודעת מערכת",
              
                modal: true
                
            });
        });
    };
</script>
<div id="dialog" style="display: none" data-backdrop="true" >

</div>

        </div> <!-- ./container -->
</asp:Content>
