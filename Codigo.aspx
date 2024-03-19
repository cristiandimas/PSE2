<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Codigo.aspx.cs" Inherits="Codigo" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>EC Cargo</title>

    <!-- Bootstrap Core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">

    <!-- Custom Fonts -->


    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico" />

    <script type="text/javascript" src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body class="logueo">
    <div>
        <div class="row">
            <img class="img-responsive center-block" src="img/LOGO.png" style="padding-top: 150px;">
        </div>
        <br>

        <!--div pagos-->
        <div class="col-lg-12">
            <img class="img-responsive center-block " style="border-radius: 25px; height: 95px;" src="img/pagos2.png">
        </div>

        <div class="col-lg-12">
            <img class="img-responsive center-block" style="border-radius: 25px; height: 70px; margin-bottom: -30px;" src="img/digitecod.png">
             
        </div>
        <div class="col-lg-12" style="align-items: center; display: flex; margin-top: 35px; margin-bottom: -20px">
            <asp:Label ID="LabelCorreo" runat="server" CssClass="center-block" Font-Bold="true" Font-Size="X-Large" ForeColor="#0d62ab"></asp:Label>
        </div>

        <div class="container">

            <form id="form1" runat="server">
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Login ID="Login1" runat="server" OnAuthenticate="Login1_Authenticate" DestinationPageUrl="~/Codigo.aspx">
                        <LayoutTemplate>
                            <!--login-->
                            <div class="top-content">
                                <div class="inner-bg">
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-sm-6 col-sm-offset-3 form-box">
                                                <div class="form-bottom">
                                                    <div class="row">
                                                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" Style="border-radius: 25px; height: 45px;" Placeholder="Nombre de usuario" Width="100%" Visible="false"></asp:TextBox>
                                                    </div>
                                                    <div class="row">
                                                        <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-password form-control" Style="border-radius: 25px; height: 45px;" Placeholder="Código" Width="100%"></asp:TextBox>
                                                    </div>
                                                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" ValidationGroup="Login1" Style="color: #ffffff"></asp:RequiredFieldValidator>
                                                    <br>
                                                    <br />
                                                    <div>
                                                        <asp:Button ID="LoginButton" runat="server" CommandName="Login" CssClass="botonimagen center-block" ImageUrl="img/ingresar.png" ValidationGroup="Login1" Style="border-radius: 25px; height: 40px; width: 220px;" />
                                                    </div>
                                                    <div>
                                                        <br>
                                                        <a href="manuales/instructivo.pdf">
                                                            <img src="img/instructivo.png" class="img-responsive center-block"></a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </LayoutTemplate>
                    </asp:Login>
                    <br />
                    <div runat="server" class="alert alert-danger" id="div_error" visible="false">
                        <strong>Error!</strong>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    </div>
                </asp:Panel>
            </form>

        </div>
    </div>
</body>
</html>
