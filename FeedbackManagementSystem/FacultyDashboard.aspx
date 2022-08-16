<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="FacultyDashboard.aspx.cs" Inherits="FacultyDashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="jumbotron db-p">
        <h1>Faculty Dashboard</h1>

        <p>
        </p>
    </div>

    <div class="row">
        
        <div class="col-sm-4 bg-info">
            
            <div class="card" style="height:18rem">
                <div class="card-body">
                <h1>Feedback</h1>
                <h4 class="card-text">Create Feedbacks for different courses to get analysis </h4>
                <a href="CreateFeedback.aspx" class="btn btn-primary btn-large">Create Feedback &raquo;</a>
                </div>
            </div>
            
        </div>
        <div class="col-sm-4 bg-info">

            <div class="card" style="height:18rem">
              <div class="card-body">
                <h1>Analysis</h1>
                <h4 class="card-text">Check Summarized Analysis for the feedbacks</h4>
                <a href="ViewAnalysis.aspx" class="btn btn-primary btn-large">View Analysis &raquo;</a>
              </div>
            </div>
        </div>
       <div class="col-sm-4 bg-info">
           <div class="card" style="height:18rem">
              <div class="card-body">
                <h1>Chart</h1>
                <h4 class="card-text">Check Detailed Graphical Analysis for the feedbacks</h4>
                <a href="ViewCart.aspx" class="btn btn-primary btn-large">View Chart &raquo;</a>
              </div>
            </div>
        </div>
    </div>
</asp:Content>

