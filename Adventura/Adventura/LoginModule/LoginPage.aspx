<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginPage.aspx.cs" Inherits="Adventura.LoginModule.LoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Log in Page</title>
      <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            background-image: url('../project images/offroad-3747184_1280.jpg');
            overflow-x: hidden;
            background-repeat: no-repeat;
        }
        #form1{

           background-color: rgba(0, 0, 0, 0.5);
           height:100vh;
        }

        .loginform {
            color: black;
            padding-top: 50PX;
            opacity:1.0;
            /*border: 1px solid white;*/
           
        }
        .input-group{
            
        }
        .white-color{
            color:white;
        }

    </style>
</head>
<body>

    <form id="form1" runat="server">
        
   <div class="row">


      <%-- LOG in Form--%>

       <div class="loginform mt-5">
             <center>
          <h2 class="white-color">Welcome to Adventura</h2>
       <h1 class="white-color">Log in</h1>
                 <br />
   

  <asp:TextBox class="input-group w-25 px-4 form-control"  ID="txtusername" placeholder="Username" runat="server"></asp:TextBox><p><br />
                       
  <asp:TextBox class="input-group w-25 px-4 form-control" ID="txtpassword" placeholder="Password" runat="server"></asp:TextBox><p>
                       
  <asp:Button Class="btn btn-success w-25" ID="BtnLogin" runat="server" Text="Login" OnClick="Button1_Click" />

       <p class="white-color mr-5">Don't have an account yet?
<div class="btn-group">
  <button type="button" class="btn btn-info dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
    Register
  </button>
  <ul class="dropdown-menu">
    <li><a class="dropdown-item" href="../GeneralModule/CustomerRegistrationpage.aspx">As a Customer</a></li>
    <li><a class="dropdown-item" href="../GeneralModule/RenderRegisterationpage.aspx">As a Render</a></li>
    
  </ul>
</div><p> 
                   </center>
       </div>
       </div>
    </form>
</body>
</html>
