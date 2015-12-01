<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GWPay Home</title>

    <!-- Bootstrap Core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	
    <!-- Custom CSS -->
	<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet">
	
    <!-- Morris Charts CSS -->
    <link href="<c:url value="/resources/css/plugins/morris.css" />" rel="stylesheet">
    
    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">

</head>


<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">GWPay Portal</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuarioLogado.login} <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Configurações</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="efetuaLogout"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <!-- Sidebar Menu Items - These collapse to the responsive navigation menu on small screens -->
            <div class="collapse navbar-collapse navbar-ex1-collapse">
                <ul class="nav navbar-nav side-nav">
				
					 <li class="active">
                        <a href="home"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
					<li>
                        <a href="conciliacao"><i class="fa fa-fw fa-check-square-o"></i> Conciliação</a>
                    </li>
                    <li >
                        <a href="transacoes"><i class="fa fa-fw fa-money"></i> Transações</a>
                    </li>
					<li>
                        <a href="consultaTransacao"><i class="fa fa-fw fa-calculator"></i> Dados Contábeis</a>
                    </li>
                
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </nav>

        <div id="page-wrapper">

            <div class="container-fluid">

                <!-- Page Heading -->
                <div class="row">
                    <div class="col-lg-12">
                        <h1 class="page-header">
                            Bem-vindo, <small>${usuarioLogado.login}</small>
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-dashboard"></i> Dashboard
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-green">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-bar-chart-o fa-fw"></i> Índice de Aprovação</h3>
                            </div>
                            <div class="panel-body">
                                <div id="morris-line-chart2"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i> Painel de Transações</h3>
                            </div>
                            <div class="panel-body">
                            
                            	<c:choose>
								  <c:when test="${fn:length(historicos) gt 0}">
								   <div class="table-responsive">
	                                    <table class="table table-bordered table-hover table-striped">
	                                        <thead>
	                                            <tr>
	                                                <th>NSU #</th>
	                                                <th>Data</th>
	                                                <th>Hora</th>
	                                                <th>Valor (R$)</th>
	                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <c:forEach items="${historicos}" var="historico">
											        <tr>
											            <td>${historico.codNSU}</td>
											            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="dd/MM/yyyy"/></td>
											            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="hh:mm:ss"/></td>
											            <td>${historico.valor}</td>
											        </tr>        
										        </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>	  
								  </c:when>
								  <c:otherwise>
								  	<p>Não há transações disponíveis.</p>
								  </c:otherwise>
								</c:choose>
            					
                                <div class="text-right">
                                    <a href="buscaTodasTransacoes">Ver todas as transações <i class="fa fa-arrow-circle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->


               
            </div>
            <!-- /.container-fluid -->

        </div>
        <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

   <!-- JQuery Core JavaScript -->
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
	
	<!-- Bootstrap Core JavaScript -->
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>

    <!-- Morris Charts JavaScript -->
    <script src="<c:url value="/resources/js/plugins/morris/raphael.min.js" />"></script>
    <script src="<c:url value="/resources/js/plugins/morris/morris.min.js" />"></script>
     <script src="<c:url value="/resources/js/plugins/morris/morris-data.js" />"></script>

	 <!-- Main Custom JavaScript -->
	<script src="<c:url value="/resources/js/main.js" />"></script>
</body>

</html>