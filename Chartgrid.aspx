<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="chartgrid.aspx.cs" Inherits="YourProjectName.chartgrid" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Grid and Chart</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            border-block-color:black;
             /*background-color: rgb(172,205,242);*/
             margin-top:115px;
        }

        .panel {
            
            border-style: solid;
            border-width: 2px;
            width: 48%;
            padding: 1px 4px;
            box-sizing: border-box;
            border-block-color:black;
            background-color:azure;
            text-emphasis-color:black;
            margin-top: 0px;
        }
        .auto-style1 {
            font-size: x-large;
        }
        .bg {
            background-color: lightskyblue;
        }
    </style>
</head>
<body>
    <h1 style="font-size:30px; text-align:center; margin-bottom: 0px;"> <b>STUDENT REPORT</b></h1>
    <form id="form1" runat="server">
        <div class="container">
            <div class="panel">
                <h2>&nbsp;&nbsp;&nbsp; Please select a roll number to view report:</h2>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text="Roll:" style="font-size: large; font-weight: 700"></asp:Label>
&nbsp;
                <asp:Label ID="Label3" runat="server" BackColor="White" Text="" style="font-size: large"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Name:" style="font-size: large; font-weight: 700"></asp:Label>
&nbsp;
                <asp:Label ID="Label4" runat="server" BackColor="White" Text="" style="font-size: large"></asp:Label>
                <br />
                <br />
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" PageSize="10" AllowPaging="true"  style="border-width: 1px; padding: 1px 4px; margin-left: 38px; vertical-align: middle;" Width="443px" HorizontalAlign="Center">
                    <Columns>
                        <asp:BoundField DataField="Semester" HeaderText="Semester" />
                        <asp:BoundField DataField="Math" HeaderText="Math" />
                        <asp:BoundField DataField="Science" HeaderText="Science" />
                        <asp:BoundField DataField="English" HeaderText="English" />
                    </Columns>
                </asp:GridView>
                <br />
                <br />
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox1" runat="server" Text="1210" CssClass="auto-style1" OnCheckedChanged="CheckBox1_CheckedChanged" AutoPostBack="True"  />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox2" runat="server" Text="1211" CssClass="auto-style1" OnCheckedChanged="CheckBox2_CheckedChanged" AutoPostBack="True" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:CheckBox ID="CheckBox3" runat="server" Text="1212" CssClass="auto-style1" OnCheckedChanged="CheckBox3_CheckedChanged" AutoPostBack="True"/>
                <br class="auto-style1" />

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;

                <asp:CheckBox ID="CheckBox4" runat="server" Text="1213" CssClass="auto-style1" OnCheckedChanged="CheckBox4_CheckedChanged" AutoPostBack="True"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:CheckBox ID="CheckBox5" runat="server" Text="1214" CssClass="auto-style1" OnCheckedChanged="CheckBox5_CheckedChanged" AutoPostBack="True"/>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
                <asp:CheckBox ID="CheckBox6" runat="server" Text="1215" CssClass="auto-style1" OnCheckedChanged="CheckBox6_CheckedChanged" AutoPostBack="True"/>
            </div>
            <div class="panel">
                <h2>&nbsp;&nbsp;&nbsp;&nbsp; Chart:</h2>
                <canvas id="myChart"></canvas>
            </div>
        </div>
    </form>

    <script>
        var ctx = document.getElementById('myChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: chartData,
            options: {
                
                plugins: {
                    title: {
                        display: true
                    },
                    legend: {
                        position: 'top'
                    }
                    
                },
                scales: {
                    y: {
                        title: {
                            display: true,
                            text: 'Marks(out of 100)'
                        },
                        beginAtZero: false
                    },
                    x: {

                        title: {
                            display: true,
                            text: 'Semesters'
                        }
                    }
                },
                responsive: true,
                maintainAspectRatio: true
            }
        });
    </script>
</body>
</html>

