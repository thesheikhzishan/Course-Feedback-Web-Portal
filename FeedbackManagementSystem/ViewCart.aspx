<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ViewCart.aspx.cs" Inherits="ViewAnalysis" %>

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
                <div><asp:Label ID="lblmsg1" Font-Bold="true" ForeColor="Red" Font-Size="Large" runat="server"></asp:Label></div>
                <div class="row">

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
                            <asp:DropDownList runat="server" ID="ddlTitle" CssClass="form-control"
                                OnSelectedIndexChanged="ddlTitle_SelectedIndexChanged" AutoPostBack="true">
                                <asp:ListItem Value="">Please Select</asp:ListItem>
                            </asp:DropDownList>
                        </div>
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
                <div><p runat="server" id="divFeed">
                       <lable><h3>Rating Description</h3></lable>
                    </p></div>

                <div class="row">
                    
                    <div class="col-lg-3"><h4>1 : Strongly Disagree</h4></div>
                    <div class="col-lg-2"><h4>2 : Disagree</h4></div>
                    <div class="col-lg-2"><h4>3 : Neutral</h4></div>
                    <div class="col-lg-2"><h4>4 : Agree</h4></div>
                    <div class="col-lg-3"><h4>5 : Strongly Agree</h4></div>
                </div>

                <div class="row">
                    <asp:Panel ID="P1"  Visible="false" runat="server">
                         <table width="100%"  >
                            <hr />
                        <tr><td colspan="3">
                             <%--<lable><h3>Question1:How would you rate the instructor for this course ?</h3></lable>--%>
                            <asp:Label ID="lblQ1" runat="server" style="font-size:large" CssClass="text-center"></asp:Label><hr /></td></tr>
                        <tr>
                           
                            <td> <asp:Chart ID="ChartQ1Bar" runat="server" Height="300px" Width="400px">
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

                   </td>
                            
                            <td>  <asp:Chart ID="ChartQ1Pie" runat="server" Height="300px" Width="400px">
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
</td>
 <td> <asp:GridView  heigth="600" ID="grdQ1" runat="server" /></td>
                        </tr>



                    </table>
                         <table width="100%"  >
                        <hr />
                        <tr><td colspan="3">
                             <%--<lable><h3>Question1:How would you rate the instructor for this course ?</h3></lable>--%>
                            <asp:Label ID="lblQ2" runat="server" style="font-size:large" CssClass="text-center"></asp:Label><hr /></td></tr>
                        <tr>
                           
                            <td> <asp:Chart ID="ChartQ2Bar" runat="server" Height="300px" Width="400px">
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

                   </td>
                            
                            <td>  <asp:Chart ID="ChartQ2Pie" runat="server" Height="300px" Width="400px">
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
</td>
 <td> <asp:GridView  heigth="600" ID="grdQ2" runat="server" /></td>
                        </tr>



                    </table>
                         <table width="100%"  >
                        <hr />
                        <tr><td colspan="3">
                             <%--<lable><h3>Question1:How would you rate the instructor for this course ?</h3></lable>--%>
                            <asp:Label ID="lblQ3" runat="server" style="font-size:large" CssClass="text-center"></asp:Label><hr /></td></tr>
                        <tr>
                           
                            <td> <asp:Chart ID="ChartQ3Bar" runat="server" Height="300px" Width="400px">
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

                   </td>
                            
                            <td>  <asp:Chart ID="ChartQ3Pie" runat="server" Height="300px" Width="400px">
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
</td>
 <td> <asp:GridView  heigth="600" ID="grdQ3" runat="server" /></td>
                        </tr>



                    </table>
                         <table width="100%"  >
                        <hr />
                        <tr><td colspan="3">
                             <%--<lable><h3>Question1:How would you rate the instructor for this course ?</h3></lable>--%>
                            <asp:Label ID="lblQ4" runat="server" style="font-size:large" CssClass="text-center"></asp:Label><hr /></td></tr>
                        <tr>
                           
                            <td> <asp:Chart ID="ChartQ4Bar" runat="server" Height="300px" Width="400px">
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

                   </td>
                            
                            <td>  <asp:Chart ID="ChartQ4Pie" runat="server" Height="300px" Width="400px">
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
</td>
 <td> <asp:GridView  heigth="600" ID="grdQ4" runat="server" /></td>
                        </tr>



                    </table>
                         <table width="100%"  >
                        <hr />
                        <tr><td colspan="3">
                             <%--<lable><h3>Question1:How would you rate the instructor for this course ?</h3></lable>--%>
                            <asp:Label ID="lblQ5" runat="server" style="font-size:large" CssClass="text-center"></asp:Label><hr /></td></tr>
                        <tr>
                           
                            <td> <asp:Chart ID="ChartQ5Bar" runat="server" Height="300px" Width="400px">
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

                   </td>
                            
                            <td>  <asp:Chart ID="ChartQ5Pie" runat="server" Height="300px" Width="400px">
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
</td>
 <td> <asp:GridView  heigth="600" ID="grdQ5" runat="server" /></td>
                        </tr>



                    </table>
                        </asp:Panel>
                </div>





            </div>
        </div>
    </div>
</asp:Content>

