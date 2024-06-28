<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Chart.aspx.cs" Inherits="MyProject.Chart" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Production Report</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <%--<<meta http-equiv="refresh" content="5" />--%>
    <style>
        .panel {
            border-style: solid;
            border-width: 2px;
            height: 300px;
            width: 1048px;
            padding: 1px 4px;
            box-sizing: border-box;
            border-block-color:black;
            background-color:azure;
            text-emphasis-color:black;
            margin-top:76px;
            margin-left: 80px;
        }
        #form1 {
            margin-top: 12px;
            margin-bottom: 464px;
            height: 645px;
        }
        .chart {
            width: 100%;
            height: 100%;
            overflow-x: auto;
            overflow-y: auto;
            scrollbar-width: thin; 
        }
        
    </style>
</head>

<body>
    <%--<h1 style="text-align:center">
        PRODUCTION REPORT
    </h1>--%>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label1" runat="server" Text="Chart Type: "></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" style="font-family: Georgia, 'Times New Roman', Times, serif" Width="142px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                <asp:ListItem>Daily</asp:ListItem>
                <asp:ListItem>Monthly</asp:ListItem>
                <asp:ListItem Selected="True">Recent</asp:ListItem>
            </asp:DropDownList>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label2" runat="server" Text="From: "></asp:Label>
&nbsp;<asp:Label ID="Label5" runat="server" Visible="False"></asp:Label>
            <asp:DropDownList ID="DropDownList4" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Width="117px" Visible="False">
                <asp:ListItem>JAN</asp:ListItem>
                <asp:ListItem>FEB</asp:ListItem>
                <asp:ListItem>MAR</asp:ListItem>
                <asp:ListItem>APR</asp:ListItem>
                <asp:ListItem>MAY</asp:ListItem>
                <asp:ListItem>JUN</asp:ListItem>
                <asp:ListItem>JUL</asp:ListItem>
                <asp:ListItem>AUG</asp:ListItem>
                <asp:ListItem>SEP</asp:ListItem>
                <asp:ListItem>OCT</asp:ListItem>
                <asp:ListItem>NOV</asp:ListItem>
                <asp:ListItem>DEC</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList2" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Visible="False" Width="117px">
                <asp:ListItem>JAN</asp:ListItem>
                <asp:ListItem>FEB</asp:ListItem>
                <asp:ListItem>MAR</asp:ListItem>
                <asp:ListItem>APR</asp:ListItem>
                <asp:ListItem>MAY</asp:ListItem>
                <asp:ListItem>JUN</asp:ListItem>
                <asp:ListItem>JUL</asp:ListItem>
                <asp:ListItem>AUG</asp:ListItem>
                <asp:ListItem>SEP</asp:ListItem>
                <asp:ListItem>OCT</asp:ListItem>
                <asp:ListItem>NOV</asp:ListItem>
                <asp:ListItem>DEC</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" Text="To:"></asp:Label>
            <asp:Label ID="Label6" runat="server" Visible="False"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList5" runat="server" OnSelectedIndexChanged="DropDownList5_SelectedIndexChanged" Width="117px" Visible="False">
                <asp:ListItem>JAN</asp:ListItem>
                <asp:ListItem>FEB</asp:ListItem>
                <asp:ListItem>MAR</asp:ListItem>
                <asp:ListItem>APR</asp:ListItem>
                <asp:ListItem>MAY</asp:ListItem>
                <asp:ListItem>JUN</asp:ListItem>
                <asp:ListItem>JUL</asp:ListItem>
                <asp:ListItem>AUG</asp:ListItem>
                <asp:ListItem>SEP</asp:ListItem>
                <asp:ListItem>OCT</asp:ListItem>
                <asp:ListItem>NOV</asp:ListItem>
                <asp:ListItem>DEC</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" Visible="False" Width="117px">
                <asp:ListItem>JAN</asp:ListItem>
                <asp:ListItem>FEB</asp:ListItem>
                <asp:ListItem>MAR</asp:ListItem>
                <asp:ListItem>APR</asp:ListItem>
                <asp:ListItem>MAY</asp:ListItem>
                <asp:ListItem>JUN</asp:ListItem>
                <asp:ListItem>JUL</asp:ListItem>
                <asp:ListItem>AUG</asp:ListItem>
                <asp:ListItem>SEP</asp:ListItem>
                <asp:ListItem>OCT</asp:ListItem>
                <asp:ListItem>NOV</asp:ListItem>
                <asp:ListItem>DEC</asp:ListItem>
            </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button1" runat="server" Text="Get Data" Width="113px" OnClick="Button1_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server"></asp:Label>
            </p>
        <div class="container">
        <div class="panel">
            <div class="chart">
            <canvas id="myChart" style="visibility:visible" aria-live="assertive"></canvas>
                </div>
        </div>
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox1" runat="server" style="font-size: large" Text="Productions" AutoPostBack="True" Checked="True" OnCheckedChanged="CheckBox1_CheckedChanged" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox2" runat="server" style="font-size: large" Text="Temperature" AutoPostBack="True" Checked="True" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:CheckBox ID="CheckBox3" runat="server" style="font-size: large" Text="Pressure" AutoPostBack="True" Checked="True" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>

    <script>
        window.onload = function updateChart() { 
            var ctx = document.getElementById('myChart').getContext('2d');
            var myChart = new Chart(ctx, {
                type: '<%=ChartType %>' ,
                    data: {
                        labels: <%=Labels %> ,
                        datasets: [{
                            label: 'Productions',
                            data: <%=Data1 %> ,
                            yAxisID: 'production-axis',
                            backgroundColor: 'rgba(75, 192, 192, 0.2)',
                            borderColor: 'rgba(75, 192, 192, 1)',
                            borderWidth: 1
                        },
                            {
                                label: 'Temperature',
                                data: <%=Data2 %>,
                                yAxisID: 'temperature-axis',
                                borderColor: 'rgba(255, 99, 132, 1)',
                                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                borderWidth: 2
                            },
                            {
                                label: 'Pressure',
                                data: <%=Data3 %>,
                                yAxisID: 'pressure-axis',
                                borderColor: 'rgba(218,174,102, 1)',
                                backgroundColor: 'rgba(218,174,102, 0.2)',
                                borderWidth: 1
                            }
                        ]
                    },
                    options: {
                        scales: {
                            x: {
                                type: 'category',
                                title: {
                                    display: true,
                                    text: 'Dates'
                                },
                                ticks:
                                {
                                    autoSkip: true,
                                    maxRotation: 90,
                                    minRotation: 90,
                                    stepSize: 10, // set the step size for the x-axis ticks
                                    maxTicksLimit: 10// set the maximum number of ticks on the x-axis
                                },
                                offset: true // Shift the labels to align with the data
                            },
                            //y: {
                            //    beginAtZero: false
                            //}
                            'production-axis':
                            { 
                                type: 'linear',
                                position: 'left',
                                title: {
                                    display: true,
                                    text: 'Productions'
                                },
                                beginAtZero: false,
                                stacked: true
                            },
                            'temperature-axis':
                            {
                                type: 'linear',
                                position: 'right',
                                title: {
                                    display: true,
                                    text: 'Temperature'
                                },
                                beginAtZero: false,
                                stacked: true
                            },
                            'pressure-axis':
                            {
                                type: 'linear',
                                position: 'right',
                                title: {
                                    display: true,
                                    text: 'Pressure'
                                },
                                beginAtZero: false,
                                stacked: true
                            }
                        },
                        plugins: {
                            title: {
                                display: true
                            },
                            legend: {
                                display: true,
                                position: 'top'
                               
                            }
                        },
                        maintainAspectRatio: false, // set this to false to allow the chart to resize
                        responsive: true // set this to true to make the chart responsiv
                    }
                });
                var chartCanvas = document.getElementById('myChart');
            chartCanvas.style.width = '800px';

            // Update legend display based on CheckBox1 status
                var checkBox1 = document.getElementById('<%= CheckBox1.ClientID %>');
                checkBox1.addEventListener('change', function () {
                    myChart.options.plugins.legend.display = checkBox1.checked;
                    myChart.update(); // Update chart to apply changes
                });
        };
        

    </script>
</body>
</html>

