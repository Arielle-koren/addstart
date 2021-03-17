<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" UnobtrusiveValidationMode="None" AutoEventWireup="true" CodeBehind="AddManager.aspx.cs" Inherits="BooksStore.AddManager" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    body {
        background-origin:C:\Projects\BooksStore\BooksStore\Image\bookspicture.png;
        background-image: C:\Projects\BooksStore\BooksStore\Image\bookspicture.png;
        border-image-source:Image/bookspicture.png />;
       
    }
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
  margin-left: -80px;
}

/* Popup arrow */
.popup .popuptext::after {
  content: "";
  position: absolute;
  top: 100%;
  left: 50%;
  margin-left: -5px;
  border-width: 5px;
  border-style: solid;
  border-color: #555 transparent transparent transparent;
}

/* Toggle this class - hide and show the popup */
.popup .show {
  visibility: visible;
  -webkit-animation: fadeIn 1s;
  animation: fadeIn 1s;
  
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
           
                <h3  class="text-info" style="color: #34b2a4; margin-left:350px; margin-top:10px; font-size:40px; font-family:Arial, Helvetica, sans-serif;">הרשמה</h3>
                <div class="form-group" style="margin-bottom:30px;">
                    <div class="col-sm-9" >
                        <asp:TextBox ID="firstName" type="text" runat="server" text-align=center; placeholder="שם פרטי (זהו שם המשתמש)" class="form-control" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="שדה חובה" ControlToValidate="firstName"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="השם יכול להכיל בין 2-25 תווים" ControlToValidate="firstName" ValidationExpression="^.{2,25}$"></asp:RegularExpressionValidator>
                    </div>
                                    
                </div>
                <div class="form-group"  style="margin-bottom:30px;">
                     <div class="col-sm-9">
                          <asp:TextBox ID="lastName" type="text" runat="server" placeholder="שם משפחה" class="form-control" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="שדה חובה" ControlToValidate="lastName"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ErrorMessage="השם יכול להכיל בין 2-25 תווים" ControlToValidate="lastName" ValidationExpression="^.{2,25}$"></asp:RegularExpressionValidator>
                         </div>
                  
                   
                </div>
                <div class="form-group" style="margin-bottom:30px;">
                      <div class="col-sm-9">
                             <asp:TextBox ID="email" runat="server" placeholder="אימייל" class="form-control" name= "email"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="שדה חובה" ControlToValidate="email"></asp:RequiredFieldValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="הכנס אימייל תקין" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="Dynamic"></asp:RegularExpressionValidator>
                    </div>
                  
                </div>
                <div class="form-group" style="margin-bottom:30px">
                     <div class="col-sm-9">
                             <asp:TextBox ID="password" type="password" runat="server" placeholder="סיסמא" class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="שדה חובה" ControlToValidate="password"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="הסיסמה צריכה להיות בין 4-8 תווים, ולכלול לפחות ספרה אחת"  ValidationExpression="^(?=.*\d).{4,8}$" ControlToValidate="password"></asp:RegularExpressionValidator>
                          <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ErrorMessage="רק אותיות באנגלית וספרות יתקבלו" ControlToValidate="password" ValidationExpression="[a-zA-Z0-9.]*$"></asp:RegularExpressionValidator>
                    </div>

                </div>
                <div class="form-group" style="margin-bottom:30px;">
                       <div class="col-sm-9">
                             <asp:TextBox ID="confirmpassword" type="password" runat="server" placeholder="סיסמת אימות" class="form-control"></asp:TextBox>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="שדה חובה" ControlToValidate="confirmpassword"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="הסיסמה לא נכונה" ControlToValidate="confirmpassword" ControlToCompare="password" Operator="Equal"></asp:CompareValidator>
                    </div>
                 
                </div>
                <div class="form-group" >
                      <div class="col-sm-9">
                            <asp:TextBox ID="birthDate" runat="server" class="form-control" placeholder="תאריך לידה DD/MM/YYYY"></asp:TextBox>
                          <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="שדה חובה" ControlToValidate="birthDate"></asp:RequiredFieldValidator>
                           <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="שים לב, התאריך לא נכון" ControlToValidate="birthDate" ValidationExpression="^(0[1-9]|[12][0-9]|3[01])[-/.](0[1-9]|1[012])[-/.](19|20)\d\d$"></asp:RegularExpressionValidator>                        
                         
                    </div>
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
       
                  
                </div>
        
        
        <div class="popup" onclick="myFunction()">
            <asp:Button ID="Button1" runat="server" Text="הירשם" class="btn btn-outline-info btn-rounded waves-effect" onClick="Button1_Click" style="background-color:gray; color:white; margin-right:15px; margin-left:430px; margin-bottom:100px; width:805px;"/>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function ShowPopup(message) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({

                title: "הודעת מערכת",
              
                modal: true
                
            });
        });
    };
</script>
<div id="dialog" style="display: none" data-backdrop="false">
</div>


 </div>
        </div> <!-- ./container -->

</asp:Content>
