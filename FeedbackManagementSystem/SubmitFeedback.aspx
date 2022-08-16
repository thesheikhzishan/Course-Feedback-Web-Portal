<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SubmitFeedback.aspx.cs" Inherits="CreateFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
        <%--<link href="Bootstrap/css/bootstrap.min.css" rel="stylesheet" />--%>  
 
   <%--<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/css/star-rating.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-star-rating/4.0.2/js/star-rating.min.js"></script>
    <script type="text/javascript">
        $(function () {
         
            $('.filled-stars').click(function () {
                var value = parseInt($(this)[0].style.width.replace('%')) / 20;
                $.ajax({
                    type: "POST",
                    url: "Default.aspx/Rate",
                    data: "{rating: " + value + "}",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    success: function (response) {
                        alert("Your rating has been saved.");
                     
                    },
                    failure: function (response) {
                        alert('There was an error.');
                    }
                });
            });
        });
      
    </script>--%>
    <script>  
        $(document).ready(function () {
            $("#input-21b").on("rating.change", function (event, value, caption) {

                var ratingValue = $('#<%=hdfRatingValue.ClientID%>').val();
               ratingValue = value;
               alert(ratingValue);
           });
       });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="db-p" style="padding-bottom: 0">

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="StudentDashboard.aspx">Home</a></li>
               <%-- <li class="breadcrumb-item">Submit Feedback</li>
                <li class="breadcrumb"><a href="ViewSubmitFeedback.aspx">View Submit Feedback</li>--%>
            </ol>
        </nav>

        <div class="jumbotron db-p">
            <%-- <br />
        <input id="rating_star" class="rating rating-loading" value="0" data-min="0" data-max="5"
            data-step="0.5" data-size="xs">
        <hr />--%>
        <span id="rating"></span>
            <div runat="server">
                <div class="row">
                    <%--  <div class="col-lg-6 col-md-6">
                        <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-center"></asp:Label>
                    </div>--%>
                     
                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label for="ddlCources">Course</label>
                            <asp:DropDownList runat="server" ID="ddlCource" OnSelectedIndexChanged="ddlCource_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="CourceRequiredValidator" runat="server" ControlToValidate="ddlCource" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Course is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <div class="form-group">
                            <label for="ddlTitle">Title</label>
                            <asp:DropDownList runat="server" ID="ddlTitle" OnSelectedIndexChanged="ddlTitle_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTitle" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Title is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtRemark">Remarks\Suggestions&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (Maximum 50 words) </label>

                            <asp:TextBox placeholder="Remarks\Suggestions" MaxLength="249" CssClass="form-control" ID="txtRemark" runat="server" Rows="3" TextMode="MultiLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtRemark" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Remark is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label for="txtDate">Date :- </label>
                            <span runat="server" id="lblDate"></span>

                        </div>
                        <div class="form-group">
                            <label for="txtDescription">Description:- </label>
                            <br />
                            <span runat="server" id="lblDescription"></span>
                        </div>


                    </div>

                    <asp:HiddenField ID="hdfRatingValue" runat="server" />  
                    <div class="col-lg-6 col-md-6">
                        <h5><b>
                            <label>Feedback Questions:-</label></b></h5>
                        <lable>Give rating</lable>
                        <div class="form-group">
                            <label for="txtQ1">Q1: </label>
                            <span runat="server" id="lblQ1"></span>
                           <%-- <asp:TextBox placeholder="20 Poor,40 Average,60 Good,80 Excellent,100 Brriliant" MaxLength="249" CssClass="form-control" ID="txtQ1" runat="server" TextMode="SingleLine"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="Q1RequiredValidator" runat="server" ControlToValidate="txtQ1" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 1 is required." Display="Dynamic"></asp:RequiredFieldValidator>
                               
                               --%>
                            <asp:DropDownList ID="ddlQ1" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Rating</asp:ListItem>
                                <asp:ListItem Value="1">1 : Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">2 : Disagree</asp:ListItem>
                                <asp:ListItem Value="3">3 : Neutral</asp:ListItem>
                                <asp:ListItem Value="4">4 : Agree</asp:ListItem>
                                <asp:ListItem Value="5">5 : Strongly Agree</asp:ListItem>
                            </asp:DropDownList>

                          
                        </div>
                        <div class="form-group">
                            <label for="txtQ2">Q2: </label>
                            <span runat="server" id="lblQ2"></span>
                            <%--<asp:TextBox placeholder="20 Poor,40 Average,60 Good,80 Excellent,100 Brriliant" MaxLength="249" CssClass="form-control" ID="txtQ2" runat="server" TextMode="SingleLine"></asp:TextBox>

                            <asp:RequiredFieldValidator ID="Q2RequiredValidator" runat="server" ControlToValidate="txtQ1" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 2 is required." Display="Dynamic"></asp:RequiredFieldValidator>--%>

                             <asp:DropDownList ID="ddlQ2" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Rating</asp:ListItem>
                                <asp:ListItem Value="1">1 : Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">2 : Disagree</asp:ListItem>
                                <asp:ListItem Value="3">3 : Neutral</asp:ListItem>
                                <asp:ListItem Value="4">4 : Agree</asp:ListItem>
                                <asp:ListItem Value="5">5 : Strongly Agree</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtQ3">Q3: </label>
                            <span runat="server" id="lblQ3"></span>

                           <%-- <asp:TextBox placeholder="20 Poor,40 Average,60 Good,80 Excellent,100 Brriliant" MaxLength="249" CssClass="form-control" ID="txtQ3" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q3RequiredValidator" runat="server" ControlToValidate="txtQ3" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 3 is required." Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <asp:DropDownList ID="ddlQ3" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Rating</asp:ListItem>
                                <asp:ListItem Value="1">1 : Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">2 : Disagree</asp:ListItem>
                                <asp:ListItem Value="3">3 : Neutral</asp:ListItem>
                                <asp:ListItem Value="4">4 : Agree</asp:ListItem>
                                <asp:ListItem Value="5">5 : Strongly Agree</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtQ4">Q4: </label>
                            <span runat="server" id="lblQ4"></span>

                           <%-- <asp:TextBox placeholder="" MaxLength="249" CssClass="form-control" ID="txtQ4" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q4RequiredValidator" runat="server" ControlToValidate="txtQ4" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 4 is required." Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <asp:DropDownList ID="ddlQ4" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Rating</asp:ListItem>
                                <asp:ListItem Value="1">1 : Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">2 : Disagree</asp:ListItem>
                                <asp:ListItem Value="3">3 : Neutral</asp:ListItem>
                                <asp:ListItem Value="4">4 : Agree</asp:ListItem>
                                <asp:ListItem Value="5">5 : Strongly Agree</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="form-group">
                            <label for="txtQ5">Q5: </label>
                            <span runat="server" id="lblQ5"></span>

                           <%-- <asp:TextBox placeholder="20 Poor,40 Average,60 Good,80 Excellent,100 Brriliant" MaxLength="249" CssClass="form-control" ID="txtQ5" runat="server" TextMode="SingleLine"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="Q5RequiredValidator" runat="server" ControlToValidate="txtQ5" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Question 5 is required." Display="Dynamic"></asp:RequiredFieldValidator>--%>
                            <asp:DropDownList ID="ddlQ5" runat="server" CssClass="form-control">
                                <asp:ListItem Value="">Please Select Rating</asp:ListItem>
                                <asp:ListItem Value="1">1 : Strongly Disagree</asp:ListItem>
                                <asp:ListItem Value="2">2 : Disagree</asp:ListItem>
                                <asp:ListItem Value="3">3 : Neutral</asp:ListItem>
                                <asp:ListItem Value="4">4 : Agree</asp:ListItem>
                                <asp:ListItem Value="5">5 : Strongly Agree</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
            <%--        <div class="row">  
  <div class="col-lg-12">  
   
  <input id="input-21a" value="0" type="number" class="rating" data-symbol="*" min=0 max=5 step=0.5 data-size="xl" >  
  <hr>  
  <input id="input-21b" type="number" class="rating" min=0 max=5 step=0.5 data-glyphicon="false" data-star-captions="{}" data-default-caption="{rating} Stars" data-size="lg">  
  <hr>  
  <input id="input-21c" value="0" type="number" class="rating" min=0 max=8 step=0.5 data-size="xl" data-stars="8">  
  <hr>  
  <input id="input-21d" value="2" type="number" class="rating" min=0 max=5 step=0.5 data-size="sm">  
  <hr>  
  <input id="input-21e" value="0" type="number" class="rating" min=0 max=5 step=0.5 data-size="xs" >  
  <hr>  
  </div>  
</div>--%>
                    <div class=" row text-right">
                       <div  class="col-lg-6 col-md-6">
                            <asp:Label ID="lblmsg" runat="server" Text="" ForeColor="Red" CssClass="text-center"></asp:Label>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="BtnSubmitFeedback" CssClass="btn btn-primary" runat="server" Text="Submit" OnClick="BtnSubmitFeedback_Click" ValidationGroup="BtnSubmit" />
                            <asp:Button ID="BtnClear" CssClass="btn btn-warning" runat="server" Text="Clear" OnClick="BtnClear_Click" />
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <div>
        <asp:GridView ID="grdSubmitedFeedback" runat="server" />
    </div>
    </a>
</asp:Content>

