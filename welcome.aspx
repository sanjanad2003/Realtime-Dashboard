<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="Dashboard.welcome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <style>
        .Div{
            background-color:azure;
            height:50%;
            width: 50%;
            top:50%;
            left:75%;
            margin-left:25%;
            margin-top:15%;
            text-align:center;
            font-size:xx-large;
            padding-top:30px;
            padding-bottom:30px;
            opacity:90%;
            border-radius:2%;
        }
        .bg {
           /* background-image:linear-gradient(to bottom right,#b3cbdd, #344b5d);*/
            background-size: auto;
            background-repeat: no-repeat;
            background-position: center;
            background-position-y:center;
            height:100%;
            background-attachment:fixed;
            margin:0;
            background-image:url('CSS/tatahd.jpg');
        }
    </style>
</head>
    
<body class="bg" >
    <form id="form1" runat="server">
        <div class="Div">
            <b>Welcome User, Click below to go to Dashboard!
            <br />
            <br />
            </b>
            <asp:Button ID="Button1" runat="server" BackColor="#739EC1" Font-Names="Bahnschrift SemiBold" Font-Size="Medium" ForeColor="#E6E1DD" OnClick="Button1_Click" Text="Continue &rarr;" Width="175px" style="margin-top: 0px" />
        &nbsp;<br />
            <asp:Button ID="logoutbtn" runat="server" BackColor="#EBFAFA" BorderColor="#ECFBFB" BorderStyle="None" ForeColor="#FF3300" Text="Logout" OnClick="btnlogout_Click"/>
        </div>
        
    </form>
</body>
</html>
