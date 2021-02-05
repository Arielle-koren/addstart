﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="OrderReciept.aspx.cs" Inherits="BooksStore.orderReciept" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="/bootstrap/4.3.1/js/bootstrap.bundle.min.js"> </script>
    <style>
        body {
    background: rgb(213, 217, 233);
    min-height: 100vh;
    vertical-align: middle;
    font-family: Muli;
    font-size: 14px
}

.card {
    margin: auto;
    width: 320px;
    max-width: 600px;
    border-radius: 20px
}

.mt-50 {
    margin-top: 50px
}

.mb-50 {
    margin-bottom: 50px
}

@media(max-width:767px) {
    .card {
        width: 100%
    }
}

@media(height:1366px) {
    .card {
        width: 100%
    }
}

#orderno {
    padding: 1vh 2vh 0;
    font-size: smaller
}

.gap .col-2 {
    background-color: rgb(213, 217, 233);
    width: 1.2rem;
    padding: 1.2rem;
    margin-top: -2.5rem;
    border-radius: 1.2rem
}

.title {
    display: flex;
    text-align: center;
    font-size: 2rem;
    font-weight: bold;
    padding: 12%
}

.main {
    padding: 0 2rem
}

.main img {
    border-radius: 7px
}

.main p {
    margin-bottom: 0;
    font-size: 0.75rem
}

#sub-title p {
    margin: 1vh 0 2vh 0;
    font-size: 1rem
}

.row-main {
    padding: 1.5vh 0;
    align-items: center
}

hr {
    margin: 1rem -1vh;
    border-top: 1px solid rgb(214, 214, 214)
}

.total {
    font-size: 1rem
}

@media(height: 1366px) {
    .main p {
        margin-bottom: 0;
        font-size: 1.2rem
    }

    .total {
        font-size: 1.5rem
    }
}

.btn {
    background-color: rgb(3, 122, 219);
    border-color: rgb(3, 122, 219);
    color: white;
    margin: 7vh 0;
    border-radius: 7px;
    width: 60%;
    font-size: 0.8rem;
    padding: 0.8rem;
    justify-content: center
}

.btn:focus {
    box-shadow: none;
    outline: none;
    box-shadow: none;
    color: white;
    -webkit-box-shadow: none;
    -webkit-user-select: none;
    transition: none
}

.btn:hover {
    color: white
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card mt-50 mb-50">
    <div class="col d-flex"><span class="text-muted" id="orderno">order #546924</span></div>
    <div class="gap">
        <div class="col-2 d-flex mx-auto"> </div>
    </div>
    <div class="title mx-auto"> תודה על הזמנתך! </div>
<asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    <div class="main"> <span id="sub-title">
            <p><b>סיכום תשלום</b></p>
        </span>
        <asp:Repeater ID="Repeater1" runat="server">
            <ItemTemplate>
        <div class="row row-main">
            <div class="col-3"> <asp:Image ID="Image1" runat="server" class="pic-1" ImageUrl='<%# Eval ("Image1","Image/{0}") %>' Width="50"/> </div>
            <div class="col-6">
                <div class="row d-flex">
                    <p><b><asp:Label ID="Label2" runat="server" Text='<%# Eval ("Name") %>'></asp:Label></b></p>
                </div>
                <div class="row d-flex">
                    <p class="text-muted"><asp:Label ID="Label3" runat="server" Text='<%# Eval ("Auther") %>'></asp:Label></p>
                </div>
            </div>
            <div class="col-3 d-flex justify-content-end">
                <p><b><asp:Label ID="Label4" runat="server" Text='<%# Eval ("Total") %>'></asp:Label></b></p>
            </div>
        </div>
                </ItemTemplate>
        </asp:Repeater>
        <hr>
        <div class="total">
            <div class="row">
                <div class="col"> <b> סה"כ לתשלום:</b> </div>
                <div class="col d-flex justify-content-end"> <b>
        <asp:Label ID="Label5" runat="server" Text=""></asp:Label></b> </div>
            </div> <button class="btn d-flex mx-auto"> Track your order </button>
        </div>
    </div>
</div>
</asp:Content>