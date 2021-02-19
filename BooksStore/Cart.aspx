<%@ Page Title="" Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="BooksStore.Cart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .img-cart {
    display: block;
    max-width: 50px;
    height: auto;
    margin-left: auto;
    margin-right: auto;
}
table tr td{
    border:1px solid #FFFFFF;
    text-align:center;
}

table tr th {
    background:#eee;
    text-align:center;
}

.panel-shadow {
    box-shadow: rgba(0, 0, 0, 0.3) 7px 7px 7px;
}
.hide
{
    visibility:hidden;
}

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <link rel="stylesheet" type="text/css" href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<div class="container bootstrap snippets bootdey">

        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-info panel-shadow">
                    <div class="panel-heading" style="align-items:center; text-align:right">
                        <h3>
                            <img class="img-circle img-thumbnail" src="Image/bookspicture.png" width="100" height="50"/>
                            <asp:Label ID="Label9" runat="server" Text="עגלת הקניות שלי"></asp:Label>
                        </h3>
                    </div>
                    <asp:Label ID="Label10" runat="server" Text=""></asp:Label>
                                                <asp:LinkButton ID="LinkButton8" runat="server" href="Home.aspx" class="btn btn-default"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&nbsp;המשך בקניות</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton9" runat="server" class="btn btn-success" OnClick="LinkButton6_Click">&nbsp;לתשלום <i class="fa fa-arrow-circle-left" aria-hidden="true"></i></asp:LinkButton>
                    <div class="panel-body"> 
                        <div class="table-responsive">
                        <table class="table">
                            <thead>
                            <tr>
                                <th>מוצר</th>
                                <th>תיאור</th>
                                <th>כמות</th>
                                <th>מחיר ליחידה</th>
                                <th>סה"כ</th>
                            </tr>
                            </thead>
                            <tbody>
                              
                                <tr>

                                </tr>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>

                                     <tr>
                                    <td><asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval ("Image1","Image/{0}") %>' class="img-cart"/></td>
                                    <td><strong><asp:Label ID="Label1" runat="server" Text='<%# Eval ("Name") %>'></asp:Label></strong><p><asp:Label ID="Label2" runat="server" Text='<%# Eval ("Auther") %>'></asp:Label></p></td>
                                    <td>
                                                                         
                                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CommandName='<%# Eval ("BooksID") %>'><i class="fa fa-sort-asc"></i></asp:LinkButton>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Eval ("NumBooks") %>'></asp:Label>
                                      
                                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click" CommandName='<%# Eval ("BooksID") %>'><i class="fa fa-sort-desc"></i></asp:LinkButton>
                                        
                                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CommandName='<%# Eval ("BooksID") %>'><i class="fa fa-trash-o">מחק</i></asp:LinkButton>
                                    </td>
                                    <td><asp:Label ID="Label4" runat="server" Text='<%# Eval ("Price") %>'></asp:Label>₪</td>
                                    <td><asp:Label ID="Label5" runat="server" Text='<%# Eval ("TOTAL") %>'></asp:Label>₪</td>
                                    </tr>

                                    </ItemTemplate>
                                </asp:Repeater>

                              
                                
                                
                                
                                <tr>
                                    <td colspan="6">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right">סך כל המוצרים</td>
                                    <td><asp:Label ID="Label6" runat="server" Text=""></asp:Label>₪ </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right">מחיר משלוח</td>
                                    <td> <asp:Label ID="Label7" runat="server" Text="0"></asp:Label>₪</td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="text-right"><strong>מחיר סופי</strong></td>
                                    <td><asp:Label ID="Label8" runat="server" Text=""></asp:Label>₪</td>
                                </tr>
                            </tbody>
                        </table>
                            
                            
                    </div>
                                                    <asp:LinkButton ID="LinkButton4" runat="server" href="Home.aspx" class="btn btn-default"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i>&nbsp;המשך בקניות</asp:LinkButton>
                            <asp:LinkButton ID="LinkButton7" runat="server" class="btn btn-success" OnClick="LinkButton6_Click">&nbsp;לתשלום <i class="fa fa-arrow-circle-left" aria-hidden="true"></i></asp:LinkButton>
                </div>

                </div>

            </div>
        </div>
    </div>

</asp:Content>
