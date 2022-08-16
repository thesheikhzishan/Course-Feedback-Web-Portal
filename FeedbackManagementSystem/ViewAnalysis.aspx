<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewAnalysis.aspx.cs" Inherits="ViewAnalysis" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="db-p" style="padding-bottom: 0">

        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="StudentDashboard.aspx">Home</a></li>
                <li class="breadcrumb-item active">View Analysis</li>
            </ol>
        </nav>

        <div class="jumbotron db-p">

            <span id="rating"></span>
            <div runat="server">
                <div class="row">

                    <div class="col-lg-6 col-md-6">
                        <div class="form-group">
                            <label for="ddlCources">Course</label>
                            <asp:DropDownList runat="server" ID="ddlCource" OnSelectedIndexChanged="ddlCource_SelectedIndexChanged" AutoPostBack="true" CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="CourceRequiredValidator" runat="server" ControlToValidate="ddlCource" ValidationGroup="BtnSubmit" CssClass="text-danger" ErrorMessage="Course is required." Display="Dynamic"></asp:RequiredFieldValidator>
                        </div>

                        <%--      <div class="form-group">
                            <label for="ddlTitle">Title</label>
                            <asp:DropDownList runat="server" ID="ddlTitle"  CssClass="form-control">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList> 
                        </div>--%>
                    </div>

                    <div class="col-lg-6 col-md-6">
                    </div>

                    <div class=" row text-right">
                        <div class="col-md-6">
                            <asp:Label ID="lblmsg" runat="server" Text="" CssClass="text-center"></asp:Label>
                        </div>
                        <div class="col-md-6">
                        </div>
                    </div>

                </div>

                <div class="row">
                    <p runat="server" id="divFeed">
                        <lable>Feedback List</lable></p>
                    <asp:GridView ID="grdView" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="FeedBack ID" />
                            <asp:BoundField DataField="Title" HeaderText="Title" />
                            <asp:BoundField DataField="StartDate" HeaderText="Date" />                           
                            <asp:TemplateField HeaderText="Average Rating">
                                <ItemTemplate>
                <asp:Label Text='<%# GetAverageRating(Eval("id").ToString())%>'
                    runat="server" />
            </ItemTemplate> 
                        </asp:TemplateField >
                              <asp:TemplateField HeaderText="View Remark">
                                <ItemTemplate>
                                    <asp:Button ID="btnView" runat="server"  Text="View " OnClick="btnView_Click" CssClass="btn btn-info" CausesValidation="false" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>

                <div class="row" runat="server" id="divRemark">
                    <p>
                        <lable>Remark of </lable>
                        <label runat="server" id="lblRemarkTitle"></label>
                    </p>
                    <asp:GridView ID="GridRemark" CssClass="table table-bordered table-hover" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" />

                        </Columns>
                    </asp:GridView>
                </div>

                <div class="row" runat="server" id="divAnalysis">
                    <asp:Chart ID="Chart1" runat="server" BackColor="0, 0, 64" BackGradientStyle="LeftRight"
                                        BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon"
                                        Width="380px" BorderlineColor="64, 0, 64">
                                        <Titles>
                                            <asp:Title ShadowOffset="10" Name="Items" />
                                        </Titles>
                                        <Legends>
                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                LegendStyle="Row" />
                                        </Legends>
                                        <Series>
                                            <asp:Series Name="Default" />
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                        </ChartAreas>
                                    </asp:Chart>
                    <p>
                        <lable>Feedback Analysis</lable></p>
                    <asp:GridView ID="Gridanalysis" CssClass="table table-bordered" runat="server" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField DataField="Question" HeaderText="Questions" />
                            <asp:BoundField DataField="Average" HeaderText="Average" />
                            <asp:TemplateField HeaderText="Chart">
                                <ItemTemplate>
                                     <%--<asp:Chart ID="Chart1" runat="server" BackColor="0, 0, 64" BackGradientStyle="LeftRight"
                                        BorderlineWidth="0" Height="360px" Palette="None" PaletteCustomColors="Maroon"
                                        Width="380px" BorderlineColor="64, 0, 64">
                                        <Titles>
                                            <asp:Title ShadowOffset="10" Name="Items" />
                                        </Titles>
                                        <Legends>
                                            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                                                LegendStyle="Row" />
                                        </Legends>
                                        <Series>
                                            <asp:Series Name="Default" />
                                        </Series>
                                        <ChartAreas>
                                            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
                                        </ChartAreas>
                                    </asp:Chart>--%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Rating" HeaderText="Rating" />

                        </Columns>
                    </asp:GridView>

                    <hr />
                    <h1>Question1 Analaysis</h1>
                     <asp:Button Text="Populate" runat="server" OnClick="PopulateChart" />
   <%-- <asp:Chart ID="Chart1" runat="server" Height="300px" Width="400px" Visible="false">
        <Titles>
            <asp:Title ShadowOffset="3" Name="Items" />
        </Titles>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                LegendStyle="Row" />
        </Legends>
        <Series>
            <asp:Series Name="Default" />
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
        </ChartAreas>
    </asp:Chart>
                    <asp:Chart ID="Chart2" runat="server" Height="300px" Width="400px" Visible="false">
        <Titles>
            <asp:Title ShadowOffset="3" Name="Items" />
        </Titles>
        <Legends>
            <asp:Legend Alignment="Center" Docking="Bottom" IsTextAutoFit="False" Name="Default"
                LegendStyle="Row" />
        </Legends>
        <Series>
            <asp:Series Name="Default" />
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" BorderWidth="0" />
        </ChartAreas>
    </asp:Chart>--%>

                </div>

            </div>
        </div>
    </div>
</asp:Content>

