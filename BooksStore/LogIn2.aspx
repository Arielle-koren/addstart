<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="LogIn2.aspx.cs" Inherits="BooksStore.LogIn2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
        body {
  margin: 0;
  padding: 0;

  height: 100vh;
}
#login .container #login-row #login-column #login-box {
  margin-top: 40px;
  max-width: 600px;
  height: 300px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
#login .container #login-row #login-column #login-box #login-form #register-link {
  margin-top: -85px;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="login">

        <div class="container">
            <div id="login-row" class="row justify-content-center align-items-center">
                <div id="login-column" class="col-md-6">
                    <div id="login-box" class="col-md-12">
                        <form id="login-form" class="form" action="" method="post">
                            <br />
                                    <h3  class="text-info" style="color: lightblue; position:center; text-align:center; margin-top:10px; font-size:40px; font-family:Arial, Helvetica, sans-serif;">התחברות</h3>
                                

                            <div class="form-group">
                                <label for="username" class="text-info" style="float:right">שם משתמש (פרטי):</label><br>
                                <asp:TextBox ID="username" runat="server" type="text" name="username" class="form-control"></asp:TextBox>
                            </div>
                            <div class="form-group">
                                <label for="password" class="text-info" style="float:right">סיסמא:</label><br>
                                <asp:TextBox ID="password" runat="server" class="form-control" type="text" name="password"></asp:TextBox>
                            </div>
                            <asp:Button ID="Button1" runat="server" Text="התחבר" class="btn btn-outline-info btn-rounded waves-effect" style="background-color:gray; color:aliceblue"/>
                        </form>
                        <div id="register-link" class="text-left">
                                <br /> <br />

                                <a href="Register.aspx" class="text-info">הירשם כאן!</a>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
