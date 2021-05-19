<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BooksStore.Statistics" UnobtrusiveValidationMode="None"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
  <div id="myPlot" style="width:100%;max-width:700px"></div>

<script>
var xArray = ["Italy", "France", "Spain", "USA", "Argentina"];
var yArray = [55, 49, 44, 24, 15];

var layout = {title:"World Wide Wine Production"};

var data = [{labels:xArray, values:yArray, type:"pie"}];

Plotly.newPlot("myPlot", data, layout);
</script>
  
   <asp:Chart ID="Chart1" runat="server">
        <Series>
            <asp:Series Name="Series1" ChartType="pie" YValueMembers="num"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1">
                 <AxisY Title="מספר" >
                        </AxisY>
                        <AxisX Title="זאנר" Interval="60">
                        </AxisX>
            </asp:ChartArea>
           
        </ChartAreas>
         <Legends>
                    <asp:Legend Docking="Bottom" Name="LegendClass"></asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="TitleChart" Font="Microsoft Sans Serif, 15pt, style=Bold" Text="Beds Statistics Summary (Class)" Alignment="TopCenter"></asp:Title>
                </Titles>
    </asp:Chart>

   
   
</asp:Content>
