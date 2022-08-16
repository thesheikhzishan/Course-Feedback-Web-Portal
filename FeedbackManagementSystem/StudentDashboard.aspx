<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="StudentDashboard.aspx.cs" Inherits="StudentDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="jumbotron db-p">
        <h1>Student Dashboard</h1>        
    </div>

    <div class="row bg-info">
        <div class="col-md-1 bg-info"></div>
        <div class="col-sm-4 bg-info">
            
            <div class="card" style="height:18rem">
                <div class="card-body">
                <h1>Feedback</h1>
                <h4 class="card-text">Submit Feedbacks for different courses</h4>
                <a class="btn btn-primary btn-lg" href="SubmitFeedback.aspx">Submit Feedback  &raquo;</a>
                </div>
            </div>
        </div>
        <div class="col-md-2 bg-info"></div>
        <div class="col-sm-4 bg-info">

            <div class="card" style="height:18rem">
              <div class="card-body">
                <h1>Submissions</h1>
                <h4 class="card-text">Check Your Submitted Feedbacks</h4>
                 <a class="btn btn-primary btn-lg"  href="ViewSubmitFeedback.aspx">View Submitted Feedbacks &raquo;</a>
              </div>
            </div>
        </div>
        <div class="col-md-1 bg-info"></div>
    </div>
</asp:Content>

