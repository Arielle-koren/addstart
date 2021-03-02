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
                  <span class="posted_in" style="flow-from:rtl"> <strong>זאנר:</strong> <a rel="tag" href="#">  <asp:Label ID="Label4" runat="server" Text=""></asp:Label></a></span>
                  <br>
                  <span class="tagged_as"><strong>סופר:</strong> <asp:Label ID="Label5" runat="server" Text=""></asp:Label> </span>
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
  </div>
   
</asp:Content>
