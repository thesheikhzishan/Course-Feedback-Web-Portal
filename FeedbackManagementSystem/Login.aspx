<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="Assets/css/bootstrap.min.css" />

    <title>Login</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <div class="container-fluid">
                <div class="row" >
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4 bg-warning">
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10 text-center">
                                <h1 style="color: green">Course Feedback System</h1>
                                <hr />
                                <h3 style="color: green">User Login</h3>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <p class="text-center">
                            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-center"></asp:Label>
                        </p>
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                               <asp:TextBox placeholder="Enter Email Id" CssClass="form-control" ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailReuiredValidator" runat="server" ControlToValidate="txtEmail" ValidationGroup="BtnLogin" CssClass="text-danger" ErrorMessage="Email Id is required." Display="Dynamic"></asp:RequiredFieldValidator>
                                <br />
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblpass" runat="server" Text="Password"></asp:Label>
                                <asp:TextBox placeholder="Enter Password" ID="txtpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PassRequiredValidator" runat="server" ControlToValidate="txtpass" ValidationGroup="BtnLogin" CssClass="text-danger" ErrorMessage="Password is required." Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtpass" ValidationGroup="BtnLogin" CssClass="text-danger" ID="PassMinMaxLenghtValidator" ValidationExpression="^[\s\S]{5,10}$" runat="server" ErrorMessage="Minimum 5 and Maximum 10 characters required."></asp:RegularExpressionValidator>
                                <br />
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Button ID="btn_login" ValidationGroup="BtnLogin" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Login" OnClick="btn_login_Click" />

                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <br />
                        <div class="row">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4 text-center">
                                <a class="btn btn-primary btn-block btn-lg" href="Register.aspx">Registration</a>
                            </div>
                            <div class="col-sm-4"></div>
                            
                        </div>

                        <br />
                    </div>
                    <div class="col-sm-4"></div>
                </div>

            </div>

        </div>
    </form>
</body>
</html>
