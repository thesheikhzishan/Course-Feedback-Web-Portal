<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewSubmitFeedback.aspx.cs" Inherits="CreateFeedback" %>

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
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <hr />
    <div class="bg-info" style="padding-bottom: 0">

        

        <div class="bg-info">
        
               <div class="col-lg-6 col-md-6">
                        <div class="form-group" style="margin-top:2rem;">
                            <label for="ddlCources">Course</label>
                            <asp:DropDownList runat="server" ID="ddlCource" OnSelectedIndexChanged="ddlCource_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="CourceRequiredValidator" runat="server" ControlToValidate="ddlCource" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Course is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                   </div>
             <div class="col-lg-6 col-md-6">
                        <div class="form-group" style="margin-top:2rem;">
                            <label for="ddlTitle">Title</label>
                            <asp:DropDownList runat="server" ID="ddlTitle" OnSelectedIndexChanged="ddlTitle_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlTitle" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Title is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>
                </div> 

    <div width="100%">
                           
             <asp:FormView CssClass="container" ID="frmSubmitedFeedback" AllowPaging="True"  runat="server" CellPadding="4" ForeColor="#333333">  
                 <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                 <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <ItemTemplate>  
                    <table class="table table-bordered table-striped">  
                        <tr>  
                            <td>Question1</td>  
                            <td><%#Eval("Q1") %></td>  
                        </tr> 
                         <tr>  
                             <td></td>  
                             <td> <asp:Label Text='<%# GetAverageRating(Eval("R1").ToString())%>' runat="server" /></td>
                             
                        </tr> 
                        <tr>  
                            <td>Question2</td>  

                            <td><%#Eval("Q2") %></td>  
                        </tr>  
                        <tr>  
                            <td></td>  
                            <td> <asp:Label Text='<%# GetAverageRating(Eval("R2").ToString())%>' runat="server" /></td>
                        </tr> 
                       <tr>  
                            <td>Question3</td>  
                            <td><%#Eval("Q3") %></td>  
                        </tr>  
                        <tr>  
                            <td></td>  
                            <td> <asp:Label Text='<%# GetAverageRating(Eval("R3").ToString())%>' runat="server" /></td>

                            
                        </tr> 
                        <tr>  
                            <td>Question4</td>  
                            <td><%#Eval("Q4") %></td>  
                        </tr>   
                        <tr>  
                            <td></td>  
                            <td> <asp:Label Text='<%# GetAverageRating(Eval("R4").ToString())%>' runat="server" /></td>

                            
                        </tr> 
                         <tr>  
                            <td>Question5</td>  
                            <td><%#Eval("Q5") %></td>  
                        </tr>  
                        <tr>  
                            <td></td>  
                            <td> <asp:Label Text='<%# GetAverageRating(Eval("R5").ToString())%>' runat="server" /></td>

                            
                        </tr> 
                         <tr>  
                            <td>Remark</td>  
                            <td><%#Eval("Remark") %></td>  
                        </tr>  
                         <tr>  
                            <td>instructorName</td>  
                            <td><%#Eval("instructorName") %></td>  
                        </tr>  
                         <tr>  
                            <td>SubmittedDate</td>  
                            <td><%#Eval("SubmittedDate") %></td>  
                        </tr> 
                         <tr>  
                            <td>FeedbackDate</td>  
                            <td><%#Eval("FeedbackDate") %></td>  
                        </tr> 
                          
                    </table>  
                </ItemTemplate>  
                 <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                 <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
            </asp:FormView>            
                         
            </div>
    </div>
        </div>
</asp:Content>

