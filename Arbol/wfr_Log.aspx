<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="wfr_Log.aspx.cs" Inherits="Arbol.wfr_Log" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <%--<title>Bootstrap 101 Template</title>--%>
    <title>Jerarquia de Empleados</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">

        <div class="container">
            <div class="page-header">
                <h1 class="text-center">Secuencia de Arbol <small>Jerarquia de Empleados</small></h1>
            </div>

            <div class="row">
                <div class="col-md-3 col-md-offset-4">

                    <ul class="nav nav-tabs" role="tablist">
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">Ingresar</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">Nuevo Usuario</a></li>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            
                            <h3 class="text-center">Ingresar</h3>

                            <div class="form-group">
                                <label>Usuario</label>
                                <asp:TextBox ID="txt_usuario" CssClass="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Clave</label>
                                <asp:TextBox ID="txt_clave" CssClass="form-control" placeholder="Clave" TextMode="Password" runat="server"></asp:TextBox>
                            </div>

                            <asp:Button ID="btn_Inicia" runat="server" Text="Inicio" CssClass="btn btn-primary btn-lg" OnClick="btn_Inicia_Click" />

                            <asp:Literal ID="lit_msj_Inicio" runat="server" />

                        </div>
                        <div role="tabpanel" class="tab-pane" id="profile">

                            <h3 class="text-center">Nuevo Usuario</h3>

                            <div class="form-group">
                                <label>Nombre</label>
                                <asp:TextBox ID="txt_Reg_Nombre" CssClass="form-control" placeholder="Nombre" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Usuario</label>
                                <asp:TextBox ID="txt_Reg_Usuario" CssClass="form-control" placeholder="Usuario" runat="server"></asp:TextBox>
                            </div>

                            <div class="form-group">
                                <label>Clave</label>
                                <asp:TextBox ID="txt_Reg_Clave" CssClass="form-control" placeholder="Clave" TextMode="Password" runat="server"></asp:TextBox>
                            </div>

                            <asp:Button ID="btn_Registro" runat="server" Text="Registrate" CssClass="btn btn-primary btn-lg" OnClick="btn_Registro_Click" />

                            <asp:Literal ID="lit_msj_Registro" runat="server" />

                        </div>
                    </div>

                </div>
            </div>

        </div>

        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        <script src="js/bootstrap.min.js"></script>
    </form>
</body>
</html>
