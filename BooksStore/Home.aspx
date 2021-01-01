<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="BooksStore.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
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
    @media only screen and (max-width:990px){.product-grid6{margin-bottom:30px}
    #custom-search-input{
    padding: 3px;
    border: solid 1px #E4E4E4;
    border-radius: 6px;
    background-color: #fff;
}

#custom-search-input input{
    border: 0;
    box-shadow: none;
}

#custom-search-input button{
    margin: 2px 0 0 0;
    background: none;
    box-shadow: none;
    border: 0;
    color: #666666;
    padding: 0 8px 0 10px;
    border-left: solid 1px #ccc;
}

#custom-search-input button:hover{
    border: 0;
    box-shadow: none;
    border-left: solid 1px #ccc;
}

#custom-search-input .glyphicon-search{
    font-size: 23px;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
    <div class="container">

        <div class="row"  dir="ltr">
        <div class="col-md-6">
            <div id="custom-search-input">
                <div class="input-group col-md-12" style="margin:10px">
                    <span class="input-group-btn" >
                    <asp:Button ID="Button1" runat="server" Text="חפש" class="btn btn-info btn-lg" type="button" Style=" padding:3px 12px" OnClick="Button1_Click"/>
                    </span>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control input-lg" placeholder="איזה ספר בא לך היום?" style="margin-left:5px;"></asp:TextBox>
                   
                </div>
            </div>
        </div>
	</div>
    <div class="row">
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
            <div class="col-md-3 col-sm-6">
            <div class="product-grid6" id="#top-section">
                <div class="product-image6">
                    <a href="#">
                        <asp:Image ID="Image1" runat="server" class="pic-1" ImageUrl='<%# Eval ("Image1","Image/{0}") %>'/>
                    </a>
                </div>
                <div class="product-content">
                    <asp:Label ID="Label1" class="title" runat="server" Text='<%# Eval ("Name") %>'><a href="#">Men's Shirt</a></asp:Label>
                    <div class="price">
                        <asp:Label ID="Label2" runat="server" style="font-size:18px;font-weight:600;color:#2e86de" Text='<%# Eval ("Price") %>'></asp:Label> ש"ח
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval ("Auther") %>'></asp:Label>
                    </div>
                                                                                    
                </div>
                <ul class="social">
                    <li><a href="ProductView.aspx" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                    <li><a href="LogIn.aspx" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li>
                    
                </ul>
            </div>
                </div>
                </ItemTemplate>
        </asp:Repeater>
    
        
</div>  
</div>

<hr>

</asp:Content>
