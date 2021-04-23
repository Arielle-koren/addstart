<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" enableEventValidation="true" Inherits="BooksStore.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css” />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script> 
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
    <style>
        h3.h3{text-align:center;margin:1em;text-transform:capitalize;font-size:1.7em;}
        .product-grid6,.product-grid6 .product-image6{overflow:hidden}
    .product-grid6{font-family:'Open Sans',sans-serif;text-align:center;position:relative;transition:all .5s ease 0s}
    .product-grid6:hover{box-shadow:0 0 10px rgba(0,0,0,.3)}
    .product-grid6 .product-image6 a{display:block}
    .product-grid6 .product-image6 img{width:100%;height:auto;transition:all .5s ease 0s}
    .product-grid6:hover .product-image6 img{transform:scale(1.1)}
    .product-grid6 .product-content{padding:12px 12px 15px;transition:all .5s ease 0s}
    .product-grid6:hover .product-content{opacity:0}
    .product-grid6 .title{font-size:20px;font-weight:600;text-transform:capitalize;margin:0 0 10px;transition:all .3s ease 0s}
    .product-grid6 .title a{color:#000}
    .product-grid6 .title a:hover{color:#2e86de}
    .product-grid6 .price{font-size:18px;font-weight:600;color:#2e86de}
    .product-grid6 .price span{color:#999;font-size:15px;font-weight:400;display:inline-block}
    .product-grid6 .social{background-color:#fff;width:100%;padding:0;margin:0;list-style:none;opacity:0;transform:translateX(-50%);position:absolute;bottom:-50%;left:50%;z-index:1;transition:all .5s ease 0s}
    .product-grid6:hover .social{opacity:1;bottom:20px}
    .product-grid6 .social li{display:inline-block}
    .product-grid6 .social li a{color:#909090;font-size:16px;line-height:45px;text-align:center;height:45px;width:45px;margin:0 7px;border:1px solid #909090;border-radius:50px;display:block;position:relative;transition:all .3s ease-in-out}
    .product-grid6 .social li a:hover{color:#fff;background-color:#2e86de;width:80px}
    .product-grid6 .social li a:after,.product-grid6 .social li a:before{content:attr(data-tip);color:#fff;background-color:#2e86de;font-size:12px;letter-spacing:1px;line-height:20px;padding:1px 5px;border-radius:5px;white-space:nowrap;opacity:0;transform:translateX(-50%);position:absolute;left:50%;top:-30px}
    .product-grid6 .social li a:after{content:'';height:15px;width:15px;border-radius:0;transform:translateX(-50%) rotate(45deg);top:-20px;z-index:-1}
    .product-grid6 .social li a:hover:after,.product-grid6 .social li a:hover:before{opacity:1}
        @media only screen and (max-width:990px) {
            .product-grid6 {
                margin-bottom: 30px
            }

            #custom-search-input {
                padding: 3px;
                border: solid 1px #E4E4E4;
                border-radius: 6px;
                background-color: #fff;
            }

                #custom-search-input input {
                    border: 0;
                    box-shadow: none;
                }

                #custom-search-input button {
                    margin: 2px 0 0 0;
                    background: none;
                    box-shadow: none;
                    border: 0;
                    color: #666666;
                    padding: 0 8px 0 10px;
                    border-left: solid 1px #ccc;
                }

                    #custom-search-input button:hover {
                        border: 0;
                        box-shadow: none;
                        border-left: solid 1px #ccc;
                    }

                #custom-search-input .glyphicon-search {
                    font-size: 23px;
                }
        }
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

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" dir="rtl">
  
    <div class="container">
        <div class="row"  dir="ltr">
        <div class="col-md-6">
            <div id="custom-search-input">
                <div class="input-group col-md-12" style="margin:10px">
                    <span class="input-group-btn" >
                    <asp:Button ID="Button1" runat="server" Text="חפש" class="btn btn-info btn-lg" type="button" Style=" padding:3px 12px" OnClick="Button1_Click"/>
                    </span>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" placeholder=" איזה ספר בא לך היום? הקלד שם ספר או סופר" style="margin-left:15px;"></asp:TextBox>
                   
                </div>

            </div>

        </div>
            
	</div>
   
        <div class="row">
            <asp:Label ID="Label11" runat="server" Text="הנמכרים ביותר:" CssClass="h2" style="color: #ffc000; font-weight: 300 ;text-align: center; font-size:30px"></asp:Label>
      <br />
            <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            <div class="col-md-3 col-sm-6">
            <div class="product-grid6" id="#top-section">
                <div class="product-image6">
                    <a href="ProductView.aspx?data=<%# Eval ("ID") %>">
                        <asp:Image ID="Image1" runat="server" class="pic-1" ImageUrl='<%# Eval ("Image1","Image/{0}") %>'/>
                    </a>
                </div>
                <div class="product-content">
                    <asp:Label ID="Label1" class="title" runat="server" Text='<%# Eval ("Name") %>'></asp:Label>
                    <div class="price">
                        <asp:Label ID="Label2" runat="server" style="font-size:18px;font-weight:600;color:#2e86de" Text='<%# Eval ("Price") %>'></asp:Label> ש"ח
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval ("Auther") %>'></asp:Label>
                    </div>
                                                                                    
                </div>
                <ul class="social">
                    <li><a href="ProductView.aspx?data=<%# Eval ("ID") %>" data-tip="עוד על הספר"><i class="fa fa-search"></i></a></li>
                    
                </ul>
                
            </div>
                
                </div>
                </ItemTemplate>
        </asp:Repeater>
    
        
</div>  
</div>

<hr>
    <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>מומלצים בשבילך</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater2" runat="server">
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
     <!-- container class for bootstrap card-->
    <br />
        <br />
    <div class="container"> 
        <h2>קטגוריה: <b>רומן</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel1"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater3" runat="server">
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
                          <asp:Label ID="Label4" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel1"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel1" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
    <br />
        <br />
      <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>מדע בדיוני ופנטזיה</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel2"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater4" runat="server">
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
                          <asp:Label ID="Label5" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel2"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel2" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
       <br />
        <br />
      <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>מדע</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel3"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater5" runat="server">
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
                          <asp:Label ID="Label6" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel3"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel3" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
       <br />
        <br />
      <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>קומדיה</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel4"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater6" runat="server">
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
                          <asp:Label ID="Label7" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel4"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel4" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
       <br />
        <br />
      <!-- container class for bootstrap card-->

    <div class="container"> 
        <h2>קטגוריה: <b>ילדים ונוער</b></h2>
        <!-- bootstrap card with row name myCarousel as row 1-->
        <div class="carousel slide" id="myCarousel5"> 
            <div class="carousel-inner"> 
                 
                <asp:Repeater ID="Repeater7" runat="server">
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
                          <asp:Label ID="Label8" class="title" runat="server" Text="לא מצאת מה שחיפשת? נסה לכתוב את שם הספר בכפתור החיפוש"></asp:Label>
                      </a> 
                    </div> 
                </div>
            </div> <a class="left carousel-control"
                      href="#myCarousel5"
                      data-slide="prev"> 
          <i class="glyphicon glyphicon-chevron-left"> 
          </i> 
          </a> 
            <a class="right carousel-control" 
               href="#myCarousel5" 
               data-slide="next"> 
              <i class="glyphicon glyphicon-chevron-right"> 
              </i> 
          </a> 
  
        </div> 
    </div> 
        <br />
</asp:Content>
