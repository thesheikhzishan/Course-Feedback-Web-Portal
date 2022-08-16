<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateFeedback.aspx.cs" Inherits="CreateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="db-p" style="padding-bottom: 0">

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="StudentDashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active">Create Feedback</li>
            </ol>
        </nav>

        <div class="jumbotron db-p">
            <div runat="server">
                <div class="row">
                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label for="ddlCources">Course</label>
                            <asp:DropDownList runat="server" ID="ddlCource" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="CourceRequiredValidator" runat="server" ControlToValidate="ddlCource" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Course is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtTitle">Title</label>
                            <asp:TextBox placeholder="Enter Title" CssClass="form-control" MaxLength="249" ID="txtTitle" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="TitleRequiredValidator" runat="server" ControlToValidate="txtTitle" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Title is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="txtDescription">Description</label>
                            <asp:TextBox placeholder="Enter Description" Rows="3" MaxLength="249" CssClass="form-control" ID="txtDescription" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="DescRequiredValidator" runat="server" ControlToValidate="txtDescription" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Description is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="txtDate">Date</label>
                            <asp:TextBox placeholder="" CssClass="form-control" ID="txtDate" runat="server" TextMode="Date"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="DateRequiredValidator" runat="server" ControlToValidate="txtDescription" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Date is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                       
                          <div class="form-group">
                            <label for="ddlRecurring">Recurrences</label>
                            <asp:DropDownList runat="server" ID="ddlRecurring" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Recurrences</asp:ListItem>
                                <asp:ListItem Value="0">Non-Recurring</asp:ListItem>
                                <asp:ListItem Value="2">Recurring Bi-Weekly for 1 month</asp:ListItem>
                                <asp:ListItem Value="4">Recurring Bi-Weekly for 2 months</asp:ListItem>
                                <asp:ListItem Value="6">Recurring Bi-Weekly for 3 months</asp:ListItem>
                                <asp:ListItem Value="2">Recurring Monthly for 2 months</asp:ListItem>
                                <asp:ListItem Value="3">Recurring Monthly for 3 months</asp:ListItem>

                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlRecurring" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Recurrences is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>





                    </div>
                    <div class="col-lg-6 col-md-6">
                        <h5><b>
                            <label>Feedback Questions:-</label></b></h5>
                        <div class="form-group">
                            <label for="txtQ1">Question 1</label>
                            <asp:TextBox placeholder="Enter Question 1"  Text="Overall, the course was well planned and organised."  MaxLength="249" CssClass="form-control" ID="txtQ1" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q1RequiredValidator" runat="server" ControlToValidate="txtQ1" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 1 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtQ2">Question 2</label>
                            <asp:TextBox placeholder="Enter Question 2"         Text="The lectures were delivered effectively."  MaxLength="249" CssClass="form-control" ID="txtQ2" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q2RequiredValidator" runat="server" ControlToValidate="txtQ1" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 2 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtQ3">Question 3</label>
                            <asp:TextBox placeholder="Enter Question 3" Text="There was sufficient opportunity for free interaction with the instructor." MaxLength="249" CssClass="form-control" ID="txtQ3" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q3RequiredValidator" runat="server" ControlToValidate="txtQ3" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 3 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtQ4">Question 4</label>
                            <asp:TextBox placeholder="Enter Question 4"  Text="Assignments/Tutorials/Quizzes were carefully set and evaluated." MaxLength="249" CssClass="form-control" ID="txtQ4" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q4RequiredValidator" runat="server" ControlToValidate="txtQ4" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 4 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtQ5">Question 5</label>
                            <asp:TextBox placeholder="Enter Question 5"  Text="You developed a clear understanding of the subject matter." MaxLength="249" CssClass="form-control" ID="txtQ5" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q5RequiredValidator" runat="server" ControlToValidate="txtQ5" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 5 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                    </div>

                </div>
                <div class=" row text-right">
                    <div class="col-md-6">
                        <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-center"></asp:Label>
                    </div>
                    <div class="col-md-6">
                        <asp:Button ID="BtnCreateFeedback" CssClass="btn btn-primary" runat="server" Text="Create" OnClick="BtnCreateFeedback_Click" ValidationGroup="BtnSubmit" />
                        <asp:Button ID="BtnClear" CssClass="btn btn-warning" runat="server" Text="Cancel" OnClick="BtnClear_Click" />
                    </div>
                </div>

            </div>
        </div>
    </div>
</asp:Content>

