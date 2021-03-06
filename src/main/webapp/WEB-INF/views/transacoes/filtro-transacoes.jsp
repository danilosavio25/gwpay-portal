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
                <a class="navbar-brand" href="index.html"><img src="<c:url value="/resources/img/gwpay-portal.png" />" class="img-logo-bar" alt="GWPay Portal"> </a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> ${usuarioLogado.nome} <b class="caret"></b></a>
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
				
				 <li >
                        <a href="home"><i class="fa fa-fw fa-home"></i> Home</a>
                    </li>
					<li>
                        <a href="conciliacao"><i class="fa fa-fw fa-check-square-o"></i> Conciliação</a>
                    </li>
                    <li >
                        <a href="transacoes" class="active"><i class="fa fa-fw fa-money"></i> Transações</a>
                    </li>
					<li>
                        <a href="#"><i class="fa fa-fw fa-calculator"></i> Dados Contábeis</a>
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
                           Transações
                        </h1>
                        <ol class="breadcrumb">
                            <li class="active">
                                <i class="fa fa-filter"></i> Filtros
                            </li>
                        </ol>
                    </div>
                </div>
                <!-- /.row -->

                <div class="row">
                    <div class="col-lg-12">
                        <form action="buscaTransacoes" method="post">
                            <div class="form-group">
                                <label for="selAdquirente">Adquirente:</label>
                                <select id="selAdquirente" class="form-control" name="adquirenteId">
                                    <option value="0">Todos</option>
                                    <c:forEach items="${adquirentes}" var="adquirente">
										<option value="${adquirente.id}">${adquirente.nome}</option>	        
									</c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="selBandeira">Bandeira:</label>
                                <select id="selBandeira" class="form-control" name="bandeiraId">
									<option value="0">Todas</option>
									<c:forEach items="${bandeiras}" var="bandeira">
                                    	<option value="${bandeira.id}">${bandeira.nome}</option>
									</c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="selProduto">Produto:</label>
                                <select id="selProduto" class="form-control">
									<option value="0">Todos</option>
                                    <option value="1">Crédito</option>
                                    <option value="2">Débito</option>
                                </select>
                            </div>
							<div class="form-group">
                                <label for="inputDataInicio">Data Inicial:</label>
                               	<input id="inputDataInicio" type="datetime-local" class="form-control"  name="dataInicio">
                            </div>
							<div class="form-group">
                                <label for="inputDataFim">Data Final:</label>
                               	<input id="inputDataFim" type="datetime-local" class="form-control" name="dataFim">
                            </div>
							<div class="form-group">
                               	<input id="bBuscar" type="submit" class="btn btn-primary btn-block" value="Buscar">
                            </div>
                        </form>
                    </div>
                </div>
                <!-- /.row -->

				<div class="row">
                    <div class="col-lg-12">
                       <div class="panel panel-default">
                            <div class="panel-heading">
                                <h3 class="panel-title"><i class="fa fa-money fa-fw"></i>Transações</h3>
                            </div>
                            <div class="panel-body">
                                <c:choose>
								  <c:when test="${fn:length(historicos) gt 0}">
								   <div class="table-responsive">
	                                    <table id="tabela-transacoes" class="table table-bordered table-hover table-striped">
	                                        <thead>
	                                            <tr>
	                                            <th></th>
												<th>NSU #</th>
												<th>Número Cartão</th>
												<th>Adquirente</th>
												<th>Bandeira</th>
												<th>Produto</th>
												<th>Data</th>
												<th>Hora</th>
												<th>Valor (R$)</th>
												<th>Status</th>
                                            </tr>
	                                        </thead>
	                                        <tbody>
	                                            <c:forEach items="${historicos}" var="historico">
											        <tr>
											          <td><a href="#" class="btn btn-danger" data-toggle="modal" data-target="#${historico.codNSU}"><i class="fa fa-search-plus"></i></a></td>
											            <td>${historico.codNSU}</td>
											            <td>${historico.numCartao}</td>
											            <td>${historico.adquirente}</td>
											            <td>${historico.bandeira}</td>
											            <td>${historico.produto}</td>
											            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="dd/MM/yyyy"/></td>
											            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="HH:mm:ss"/></td>
											           <td>${historico.valor}</td>
											            <td>${historico.descricaoResposta}</td>
											        </tr>
											        <!-- Modal -->
													<div id="${historico.codNSU}" class="modal fade" role="dialog">
													  <div class="modal-dialog">
													
													    <!-- Modal content-->
													    <div class="modal-content">
													      <div class="modal-header">
													        <button type="button" class="close" data-dismiss="modal">&times;</button>
													        <h4 class="modal-title">Detalhe da transação</h4>
													      </div>
													      <div class="modal-body">
													        	<div class="form-group">
									                                <label for="nsu_modal">NSU:</label>
									                               	<input id="nsu_modal" type="text" class="form-control"  name="nsu_modal" value="${historico.codNSU}" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="status_modal">Status:</label>
									                               	<input id="status_modal" type="text" class="form-control"  name="status_modal" value="${historico.descricaoResposta}" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="valor_modal">Valor(R$):</label>
									                               	<input id="valor_modal" type="text" class="form-control"  name="valor_modal" value="${historico.valor}" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="data_hora_modal">Data/Hora:</label>
									                               	<input id="data_hora_modal" type="text" class="form-control"  name="data_hora_modal" value="<fmt:formatDate value="${historico.dataTransacao}" pattern="dd/MM/yyyy HH:mm:ss"/>" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="cartao_modal">Cartão:</label>
									                               	<input id="cartao_modal" type="text" class="form-control"  name="cartao_modal" value="${historico.numCartao}" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="bandeira_modal">Bandeira:</label>
									                               	<input id="bandeira_modal" type="text" class="form-control"  name="bandeira_modal" value="${historico.bandeira}" readonly >
									                            </div> 
									                            <div class="form-group">
									                                <label for="adquirente_modal">Adquirente:</label>
									                               	<input id="adquirente_modal" type="text" class="form-control"  name="adquirente_modal" value="${historico.adquirente}" readonly >
									                            </div>
									                            <div class="form-group">
									                                <label for="produto_modal">Produto:</label>
									                               	<input id="produto_modal" type="text" class="form-control"  name="produto_modal" value="${historico.produto}" readonly >
									                            </div>
													      </div>
													      <div class="modal-footer">
													        <button type="button" class="btn btn-primary" data-dismiss="modal">Fechar</button>
													      </div>
													    </div>
													
													  </div>
													</div>        
										        </c:forEach>
	                                        </tbody>
	                                    </table>
	                                </div>	  
								  </c:when>
								  <c:otherwise>
								  	<p>Não há transações disponíveis.</p>
								  </c:otherwise>
								</c:choose>
            					
                            </div>
                        </div>
                    </div>
                </div>
               
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


	<!--DataTables JavaScript -->	
	<script src="<c:url value="/resources/js/plugins/dataTables/jquery.dataTables.min.js" />"></script>
	<script src="<c:url value="/resources/js/plugins/dataTables/dataTables.bootstrap.min.js" />"></script>
   
    <!-- Main Custom JavaScript -->
	<script src="<c:url value="/resources/js/main.js" />"></script>
   
   
    <!-- Date Format JavaScript -->
	<script src="<c:url value="/resources/js/dateFormat.js" />"></script>
   
   
	<script>
		$(document).ready(function(){
			geraDataTable("tabela-transacoes");
			iniciaForm();
		});
	</script>

</body>

</html>