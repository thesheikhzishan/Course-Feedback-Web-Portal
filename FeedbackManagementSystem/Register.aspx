<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="Assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="Assets/css/custom.css" />
    <title>Registration</title>
</head>
<body style="padding-top:0;">
    <form id="form1" runat="server">
        <div>

            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-4"></div>
                    <div class="col-sm-4 bg-warning">
                        <div class="row">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10 text-center">
                                <h1 style="color: green">Course Feedback System</h1>
                                <hr />
                                <h3 style="color: green">User Registration</h3>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <p class="text-center">
                            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-center"></asp:Label>
                        </p>
                        <div class="row m-b-10">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                <asp:TextBox placeholder="Enter User Name" CssClass="form-control" ID="txtName" runat="server" TextMode="SingleLine"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="NameRequiredValidator" runat="server" ControlToValidate="txtName" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="User name is required." Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblemail" runat="server" Text="Email"></asp:Label>
                                <asp:TextBox placeholder="Enter Email Id" CssClass="form-control" ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="EmailReuiredValidator" runat="server" ControlToValidate="txtEmail" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="Email Id is required." Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblRole" runat="server" Text="Role"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlRole" CssClass="form-control">
                                    <asp:ListItem Value="">Please Select</asp:ListItem>
                                    <asp:ListItem Value="Student">Student</asp:ListItem>
                                    <asp:ListItem Value="Instructor">Instructor</asp:ListItem>

                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RoleRequiredValidator" runat="server" ControlToValidate="ddlRole" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="Role is required." Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblDeprt" runat="server" Text="Department"></asp:Label>
                                <asp:DropDownList runat="server" ID="ddlDepart" CssClass="form-control" OnSelectedIndexChanged="ddlDepart_SelectedIndexChanged" AutoPostBack="true">
                                    <asp:ListItem Value="">Please Select</asp:ListItem>
                                    <asp:ListItem Value="Computer Science & Engineering">Computer Science & Engineering</asp:ListItem>
                                    <asp:ListItem Value="Electrical Engineering">Electrical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Mechanical Engineering">Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem Value="Civil Engineering">Civil Engineering</asp:ListItem>

                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="DepartRequiredValidator" runat="server" ControlToValidate="ddlDepart" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="Department is required." Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row m-b-10" id="CourceDiv" runat="server">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblCources" runat="server" Text="Courses"></asp:Label>
                                <asp:ListBox runat="server" ID="ddlCources" SelectionMode="Multiple" CssClass="form-control" 
                                    
                                    >
                                    <%--<asp:ListItem Value="">Please Select</asp:ListItem>--%>
                                   <%-- <asp:ListItem Value="None">None</asp:ListItem>
                                    <asp:ListItem Value="Data Structure & Algorithms">Data Structure & Algorithms</asp:ListItem>
                                    <asp:ListItem  Value="Artificial Intelligence">Artificial Intelligence</asp:ListItem>
                                    <asp:ListItem Value="Digital Systems">Digital Systems</asp:ListItem>
                                    <asp:ListItem Value="Digital Signal Processing">Digital Signal Processing</asp:ListItem>
                                    <asp:ListItem Value="Kinematics Analysis & Synthesis">Kinematics Analysis & Synthesis</asp:ListItem>
                                    <asp:ListItem Value="Fluid Mechanics">Fluid Mechanics</asp:ListItem>
                                    <asp:ListItem Value="Fracture Mechanics">Fracture Mechanics</asp:ListItem>
                                    <asp:ListItem Value="Structural Engineering">Structural Engineering</asp:ListItem>--%>

                                </asp:ListBox>
                                <asp:RequiredFieldValidator ID="CourceRequiredValidator" runat="server" ControlToValidate="ddlCources" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="Course is required." Display="Dynamic"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <div class="row m-b-10">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Label ID="lblpass" runat="server" Text="Password"></asp:Label>
                                <asp:TextBox placeholder="Enter Password" ID="txtpass" CssClass="form-control" runat="server" r TextMode="Password"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PassRequiredValidator" runat="server" ControlToValidate="txtpass" ValidationGroup="BtnRegister" CssClass="text-danger" ErrorMessage="Password is required." Display="Dynamic"></asp:RequiredFieldValidator>

                                <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="txtpass" ValidationGroup="BtnRegister" CssClass="text-danger" ID="PassMinMaxLenghtValidator" ValidationExpression="^[\s\S]{5,10}$" runat="server" ErrorMessage="Minimum 5 and Maximum 10 characters required."></asp:RegularExpressionValidator>
                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <br />

                        <div class="row ">
                            <div class="col-sm-1"></div>
                            <div class="col-sm-10">
                                <asp:Button ID="Btn_register" CssClass="btn btn-success btn-block btn-lg" runat="server" Text="Register" OnClick="Btn_register_Click" ValidationGroup="BtnRegister" />

                            </div>
                            <div class="col-sm-1"></div>
                        </div>
                        <br />
                        <div class="row ">
                            <div class="col-sm-4"></div>
                            <div class="col-sm-4 text-center">
                                <a class="btn btn-block btn-primary btn-lg" href="Login.aspx">Login</a>
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
