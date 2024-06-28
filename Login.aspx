<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="YourProjectName.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login Page</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: center;
            background-color:azure;
            opacity:80%;
            padding-top:10px;
            padding-bottom:10px;
            border-radius:2%;
        }
        #Text1 {
            width: 216px;
            height: 27px;
            margin-bottom: 1px;
        }
        #Reset1 {
            width: 129px;
        }
        .body-bg {
           /*background-image:linear-gradient(to bottom right,#b3cbdd, #344b5d);*/
            background-size: auto;
            background-repeat: no-repeat;
            background-position: center;
            background-position-y:center;
            height:100%;
            background-attachment:fixed;
            margin:0;
            background-image:url('CSS/tatahd.jpg');
        }
        #Text2 {
            width: 266px;
        }
        
            .Div 
            {
                position: absolute;
                width: 43%;
                height: 170px;
                background-color: rgb(231, 248, 246);
                text-align: center;
                top: 43%;
                left: 52%;
                transform: translate(-50%, -50%);
                opacity: 80%;
                padding-bottom: 50px;
                padding-top: 70px;
                padding-left: 0px;
                padding-right: 100px;
                border-radius:2%;
                margin-top: 50px;
                font-size: xx-large;
            }
            
  
       
        .card {
            height: 257px;
            width: 733px;
            margin-left: 356px;
            margin-top: 124px;
            margin-bottom: 158px;
            font-size: x-large;
            background-color: #E1E1E1;
        }
        .form-group {
            font-size: large;
            margin-left: 98px;
        }
            
  
       
        .btn-primary {
            margin-left: 59px;
            font-size: medium;
            background-color: #33CC33;
        }
            
  
       
        .form-control {}
            
  
       
    </style>
</head>
<body class="body-bg">
    <h1 class="auto-style1" style="font-family: Georgia, 'Times New Roman', Times, serif; font-size:xx-large; height: 77px; margin-bottom: 0px;">
        DEVELOPMENT OF A REAL TIME DASHBOARD FOR VISUALISATION OF KEY PROCESS PARAMETERS.</h1>

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="Div">
                    
                    <div class="card-body">
                        <form id="form1" runat="server">
                            <div class="form-group">
                                <label style="font-size:x-large" for="txtUsername">Username: </label>
                                &nbsp;<asp:TextBox ID="txtUsername" CssClass="form-control" runat="server" Width="263px" ></asp:TextBox>
                            </div>
                            <br>
                            <div class="form-group">
                                <label style="font-size:x-large" for="txtPassword">Password: </label>
                                &nbsp;<asp:TextBox ID="txtPassword" CssClass="form-control" TextMode="Password" runat="server" Width="261px"></asp:TextBox>
                            </div>
                            <br >
                            <div class="form-group text-center">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <asp:Button ID="btnSignIn" CssClass="btn btn-primary" runat="server" Text="Sign In" OnClick="btnSignIn_Click" Width="111px" />
                                <asp:Button ID="Button1" runat="server" style="margin-left: 48px; font-size: medium; background-color: #D50000;" Text="Reset" Width="112px" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
                            </div>
                            <div class="form-group text-center">
                                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

