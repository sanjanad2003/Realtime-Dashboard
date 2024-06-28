<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Data.aspx.cs" Inherits="Dashboard.Data" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<%@ Register assembly="Devart.Data.MySql.Web, Version=9.3.10.0, Culture=neutral, PublicKeyToken=09af7300eec23701" namespace="Devart.Common.Web" tagprefix="cc1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Data Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style type="text/css">
        .text-center {
            text-align: center;
            font-size: 50px;
            height: 80px;
            background-color:rgb(231, 248, 246);
            padding-top:10px;
            font-family:Georgia;
            margin-bottom: 30px;
            margin-top:5px;
            opacity:80%;
        }
        #form1 {
            text-align: center;
            margin-left: 0px;
            margin-top: 110px;
        }
        .table-bordered {
            margin-left: 128px;
            margin-top: 0px;
        }
        .bg 
        {
            background-size: auto;
            background-repeat: no-repeat;
            background-position: center;
            height:100%;
            background-attachment:fixed;
            margin:0 0 0px 0;
            background-image:url('CSS/tatahd.jpg');
        }
        .grid { 
            padding: 50px 0px;
            margin-top: 0px;
            margin-bottom: 0px;
            margin-left: 263px;
            margin-right: 193px;
            background-color:rgb(240, 251, 250);
            border-radius: 13px;
            height: 243px;
        }
    </style>
</head>
<body class="bg" style="text-align: center">
    <div class="container my-5">
        <h1 class="text-center">Data Grid</h1>
        <form id="form1" runat="server">
            <div class="grid">
            <asp:GridView SkinID="grid" ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="table table-striped table-bordered" Font-Size="Large" CellPadding="4" CellSpacing="3" BackColor="#76A1C4" BorderColor="Black" >
                <Columns>
                    <asp:BoundField DataField="Roll" HeaderText="Roll no." />
                    <asp:BoundField DataField="Name" HeaderText="Name" />
                    <asp:BoundField DataField="MarksinMath" HeaderText="Marks in Math" />
                    <asp:BoundField DataField="MarksinScience" HeaderText="Marks in Science" />
                    <asp:BoundField DataField="MarksinEnglish" HeaderText="Marks in English" />
                   <%-- <asp:TemplateField HeaderText="Actions">--%>
                        <%--<ItemTemplate>
                            <a href="ViewDetails.aspx?ID=#Eval("Roll no.") " class="btn btn-primary btn-sm">View</a>
        <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm" CommandName="Delete" CommandArgument='#Eval("Roll no.") ' OnClientClick="return confirm('Are you sure you want to delete this record?');">Delete</asp:LinkButton>
                        </ItemTemplate>--%>
                    <%--</asp:TemplateField>--%>
                </Columns>
                <HeaderStyle Font-Bold="True" />
            </asp:GridView>
                <br />
                <br />
                <asp:Button ID="goto" runat="server" style="margin-left: 48px; font-size: medium; background-color:cornflowerblue;" Text="Go to chart" Width="112px" OnClick="goto_Click" />
                </div>
        </form>
    </div>
</body>
</html>

