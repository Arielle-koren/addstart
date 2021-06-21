<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" UnobtrusiveValidationMode="None" CodeBehind="ProductView.aspx.cs" Inherits="BooksStore.ProductView" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.product_meta a, .pro-price{
    color:#fc5959 ;
}

.pro-price, .amount-old {
    font-size: 18px;
    padding: 0 10px;
}

.amount-old {
    text-decoration: line-through;
}

.quantity {
    width: 120px;
}

.pro-img-list {
    margin: 10px 0 0 -15px;
    width: 100%;
    display: inline-block;
}

.pro-img-list a {
    float:left;
    margin-right: 10px;
    margin-bottom: 10px;
}

.pro-d-head {
    font-size: 18px;
    font-weight: 300;
}


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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    
<div class="container bootdey" style="text-align:right">
<div class="col-md-12">
<section class="panel" style="margin:15px; padding-left:2em">
      <div class="panel-body">
          <asp:Label ID="Label6" runat="server" Text="" Style="color:red;"></asp:Label>
       <div class="row">
              <aside class="col-md-6">
              <div class="pro-img-details"  >
                  <asp:Image ID="Image1" runat="server" />
                  
              </div>
       
          </aside>
          <aside class="col-md-6" >
              <h4 class="pro-d-title">
                 
                       <asp:Label ID="Label3" runat="server" Text=""></asp:Label>
                  
              </h4>
              <p>
                  <asp:Label ID="Label1" runat="server" Text="" Font-Size="Small"></asp:Label>
               
              </p>
              <div class="product_meta">
                  <span class="posted_in" style="flow-from:rtl"> <strong>זאנר: </strong><asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">  <asp:Label ID="Label4" runat="server" Text=""></asp:Label></asp:LinkButton> </span>
                  <br>
                  <span class="tagged_as"><strong>סופר: </strong> <asp:Label ID="Label5" runat="server" Text=""></asp:Label> </span>
              </div>
              <div class="m-bot15"> <strong>מחיר: </strong> <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
              <div class="form-group">
                  <strong><label>כמות:</label></strong>
                  <asp:TextBox ID="TextBox1" runat="server" type="quantiy" Text="1" class="form-control quantity"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox1" ValidationExpression="^[1-9][0-9]*$"></asp:RegularExpressionValidator>
              </div>
                
            
      
              
      </div>
               <asp:Button ID="Button2" runat="server" Text="הוספה לסל" class="btn btn-round btn-danger" OnClick="Button2_Click" />
          </aside>
          </div>
          </div>
  </section>
  </div>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
     
    <div class="popup" onclick="myFunction()">

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/jquery-ui.js" type="text/javascript"></script>
<link href="http://ajax.aspnetcdn.com/ajax/jquery.ui/1.8.9/themes/start/jquery-ui.css"
    rel="stylesheet" type="text/css" />
<script type="text/javascript">
    function ShowPopup(message) {
        $(function () {
            $("#dialog").html(message);
            $("#dialog").dialog({

                title: "<- לסגירה|__ הודעת מערכת",
              
                modal: true
                
            });
        });
    };
</script>
<div id="dialog" style="display: none" data-backdrop="false">
</div>


 </div>
  </div>
   
</asp:Content>
