<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                <a class="navbar-brand" href="index.html">GWPay Portal</a>
            </div>
            <!-- Top Menu Items -->
            <ul class="nav navbar-right top-nav">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown"><i class="fa fa-user"></i> Renato Arcari <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#"><i class="fa fa-fw fa-user"></i> Perfil</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-gear"></i> Configurações</a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#"><i class="fa fa-fw fa-power-off"></i> Log Out</a>
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
                        <a href="dados-contabeis"><i class="fa fa-fw fa-calculator"></i> Dados Contábeis</a>
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
                        <form>
                            <div class="form-group">
                                <label for="selAdquirente">Adquirente:</label>
                                <select id="selAdquirente" class="form-control">
                                    <option value="0">Todos</option>
                                    <option value="1">GetNet</option>
                                    <option value="2">Rede</option>
                                    <option value="3">Cielo</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="selBandeira">Bandeira:</label>
                                <select id="selBandeira" class="form-control">
									<option value="0">Todas</option>
                                    <option value="1">VISA</option>
                                    <option value="2">MASTER</option>
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
                                <label for="selDataInicial">Data Inicial:</label>
                               	<input id="selDataInicial" type="datetime-local" class="form-control">
                                </select>
                            </div>
							<div class="form-group">
                                <label for="selDataFinal">Data Final:</label>
                               	<input id="selDataFinal" type="datetime-local" class="form-control">
                                </select>
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
                                <div class="table-responsive">
                                    <table id="tabela-transacoes" class="table table-bordered table-hover table-striped">
                                        <thead>
                                            <tr>
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
                                            <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
											  <tr>
                                                <td>3326</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:29</td>
                                                <td>321,33</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3325</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:20</td>
                                                <td>234,34</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3324</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:03</td>
                                                <td>724,17</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3323</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>15:00</td>
                                                <td>23,71</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3322</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:49</td>
                                                <td>8345,23</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3321</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:23</td>
                                                <td>245,12</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3320</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:15</td>
                                                <td>5663,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3319</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:13</td>
                                                <td>943,45</td>
												<td>APROVADA</td>
                                            </tr>
											<tr>
                                                <td>3318</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:09</td>
                                                <td>453,54</td>
												<td>APROVADA</td>
                                            </tr>
                                            <tr>
                                                <td>3317</td>
												<td>545301******3303</td>
												<td>GetNet</td>
												<td>MASTER</td>
												<td>Crédito</td>
                                                <td>22/10/2015</td>
                                                <td>14:00</td>
                                                <td>300,00</td>
												<td>APROVADA</td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
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
   
   
	<script>
		$(document).ready(function(){
			$('#tabela-transacoes').DataTable({
			
				language:{
					"sEmptyTable": "Nenhum registro encontrado",
					"sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
					"sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
					"sInfoFiltered": "(Filtrados de _MAX_ registros)",
					"sInfoPostFix": "",
					"sInfoThousands": ".",
					"sLengthMenu": "_MENU_ resultados por página",
					"sLoadingRecords": "Carregando...",
					"sProcessing": "Processando...",
					"sZeroRecords": "Nenhum registro encontrado",
					"sSearch": "Pesquisar",
					"oPaginate": {
						"sNext": "Próximo",
						"sPrevious": "Anterior",
						"sFirst": "Primeiro",
						"sLast": "Último"
					},
					"oAria": {
						"sSortAscending": ": Ordenar colunas de forma ascendente",
						"sSortDescending": ": Ordenar colunas de forma descendente"
					}
				}
			});
		});
		
		{
    
}
	</script>

</body>

</html>