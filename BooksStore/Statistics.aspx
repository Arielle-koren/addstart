<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BooksStore.Statistics" UnobtrusiveValidationMode="None"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
    .box {
    width: 500px;
    margin: 200px 0;
}

.shape1{
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -50px;
}
.shape2 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
}
.shape3 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -30px;
    float: left;
    margin-left: -31px;
}
.shape4 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    margin-top: -25px;
    float: left;
    margin-left: -32px;
}
.shape5 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -48px;
    margin-left: -32px;
    margin-top: -30px;
}
.shape6 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -35px;
}
.shape7 {
    position: relative;
    height: 150px;
    width: 150px;
    background-color: #0074d9;
    border-radius: 80px;
    float: left;
    margin-right: -20px;
    margin-top: -57px;
}
.float {
    position: absolute;
    z-index: 2;
}

.form {
    margin-left: 145px;
}
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <div class="container">
        <div id="login-row" class="row justify-content-center align-items-center">
            <div id="login-column" class="col-md-6">
                <div class="box">
                    <div class="shape1"></div>
                    <div class="shape2"></div>
                    <div class="shape3"></div>
                    <div class="shape4"></div>
                    <div class="shape5"></div>
                    <div class="shape6"></div>
                    <div class="shape7"></div>
                    <div class="float">
                        <form class="form" action="">
                            <div class="form-group">
                                <label for="username" class="text-white">קוד הזמנה:</label><br>
                                <asp:TextBox ID="TextBox1" runat="server" class="form-control"></asp:TextBox>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox1" ValidationExpression="^[1-9][0-9]*$"></asp:RegularExpressionValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="לא תקין" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>

                            </div>

                            <div class="form-group">
                            <asp:Button ID="Button1" runat="server" Text="חפש סטטוס הזמנה" class="btn btn-info btn-md" OnClick="Button1_Click"/>
                            </div>
                            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
