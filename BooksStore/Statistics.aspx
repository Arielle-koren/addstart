<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BooksStore.Statistics" UnobtrusiveValidationMode="None"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css” />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <style> 
 .carousel { 
 width:1100px; 
 height:200px; 
 } 
 h2 {
	color: #000;
	font-size: 26px;
	font-weight: 300;
	text-align: center;
	text-transform: uppercase;
	position: relative;
	margin: 30px 0 80px;
}
h2 b {
	color: #ffc000;
}
h2::after {
	content: "";
	width: 100px;
	position: absolute;
	margin: 0 auto;
	height: 4px;
	background: rgba(0, 0, 0, 0.2);
	left: 0;
	right: 0;
	bottom: -20px;
}
 .title{font-size:20px;font-weight:600;text-transform:capitalize;margin:0 0 10px;transition:all .3s ease 0s}
 .title a{color:#000}
  .title a:hover{color:#2e86de}
 </style>
    <script type="text/javascript"
            src="//code.jquery.com/jquery-1.9.1.js"> 
  </script> 
    <link rel="stylesheet" 
          type="text/css" 
          href="/css/result-light.css"> 
    
    <script type="text/javascript" 
            src= 
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"> 
  </script> 
    <link rel="stylesheet" 
          type="text/css" 
          href= 
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css"> 
    <link rel="stylesheet"
          type="text/css" 
          href= 
"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"> 
    <!-- JavaScript for adding  
     slider for multiple images 
     shown at once-->
    <script type="text/javascript"> 
        $(window).load(function() { 
            $(".carousel .item").each(function() { 
                var i = $(this).next(); 
                i.length || (i = $(this).siblings(":first")), 
                  i.children(":first-child").clone().appendTo($(this)); 
                
                for (var n = 0; n < 4; n++)(i = i.next()).length || 
                  (i = $(this).siblings(":first")), 
                  i.children(":first-child").clone().appendTo($(this)) 
            }) 
        }); 
    </script> 
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>דרמה</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater1" runat="server">
                    <ItemTemplate>
                <div class="item"> 
                    <div class="col-xs-2"> 
                        <a href="ProductView.aspx?data=<%# Eval ("ID") %>"> 
                            <asp:Image ID="Image1" runat="server" class="img-responsive" ImageUrl='<%# Eval ("Image1","Image/{0}") %>'/>
                       
                      </a> 
                        <asp:Label ID="Label1" class="title" runat="server" Text='<%# Eval ("Name") %>'></asp:Label>
                        <br />
                        <asp:Label ID="Label2" runat="server" style="font-size:18px;font-weight:600;color:#2e86de" Text='<%# Eval ("Price") %>'></asp:Label> ש"ח
                    </div> 
                </div> 
</ItemTemplate>
                </asp:Repeater>
                <div class="item active"> 
                    <div class="col-xs-2"> 
                        <a href="Home.aspx"> 
                          <asp:Label ID="Label1" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
 
</asp:Content>
