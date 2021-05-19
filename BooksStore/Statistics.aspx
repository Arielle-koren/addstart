<%@ Page Title="" Language="C#" MasterPageFile="~/Manager.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="BooksStore.Statistics" UnobtrusiveValidationMode="None"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
  <script src="https://cdn.plot.ly/plotly-latest.min.js"></script>


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
   <aside class="col-md-6" >
    <asp:Chart ID="Chart2" runat="server" Height="700px" Width="1000px" >
        <Series>
            <asp:Series Name="Series1" IsValueShownAsLabel="true" LegendText="הכנסות"  ChartType="Column" YValueMembers="in" XValueMember="M" Font="Microsoft Sans Serif, 12pt" Legend="LegendClass" Color="Green"></asp:Series>
        </Series>
        <Series>
            <asp:Series Name="Series2" IsValueShownAsLabel="true" LegendText="הוצאות"  ChartType="Column" YValueMembers="out" XValueMember="M" Font="Microsoft Sans Serif, 12pt" Legend="LegendClass" Color="red"></asp:Series>
        </Series>
        <ChartAreas>
            <asp:ChartArea Name="ChartArea1" >
                 <AxisY Title="סכום" >
                        </AxisY>
                        <AxisX Title="חודש">
                        </AxisX>
            </asp:ChartArea>
           
        </ChartAreas>
         <Legends>
                    <asp:Legend Docking="Bottom" Name="LegendClass"></asp:Legend>
                </Legends>
                <Titles>
                    <asp:Title Name="TitleChart" Font="Microsoft Sans Serif, 15pt, style=Bold" Text="הוצאות והכנסות מהשנה הנוכחית" Alignment="TopCenter"></asp:Title>
                </Titles>
    </asp:Chart>
   
   </aside>

     <aside class="col-md-6" >

   <asp:Chart ID="Chart1" runat="server" Height="500px" Width="720px">
        <Series>
            <asp:Series Name="Series1" ChartType="pie" YValueMembers="num" IsValueShownAsLabel="True" Font="Microsoft Sans Serif, 12pt" Legend="LegendClass"></asp:Series>
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
                    <asp:Title Name="TitleChart" Font="Microsoft Sans Serif, 15pt, style=Bold" Text="מספר הספרים שנמכרו מכל זאנר" Alignment="TopCenter"></asp:Title>
                </Titles>
    </asp:Chart>
         </aside>

</asp:Content>
