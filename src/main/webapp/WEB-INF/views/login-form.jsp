<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>GWPay Login</title>

    <!-- Bootstrap Core CSS -->
	<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
	
    <!-- Custom CSS -->
	<link href="<c:url value="/resources/css/sb-admin.css" />" rel="stylesheet">
	
    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css" />" rel="stylesheet">
    

</head>
<body>
	
	<div class="container-fluid">
                <div class="row">
					<div class="col-lg-4">
					</div>
                    <div class="col-lg-4">
						
						 <div id="loginPanel" class="panel panel-default">
                            <div class="panel-body">
								<img src="<c:url value="/resources/img/gwpay-portal.png" />" class="img-responsive" alt="GWPay Portal"> 
                                 <form action="efetuaLogin" method="post">
									<div class="form-group">
										<input id="bUsuario" type="text" class="form-control" placeholder="Usuário" name="login">
									</div>
									<div class="form-group">
										<input id="bSenha" type="password" class="form-control" placeholder="Senha" name="senha">
									</div>
									<div class="form-group">
										<button  id="bEntrar" type="submit" class="btn btn-primary btn-block">
											<i class="fa fa-sign-in fa-fw"></i> Login
										</button>
									</div>
								</form>
                            </div>
                        </div>
                      
                    </div>
                </div>
                <!-- /.row -->
               
            </div>
            <!-- /.container-fluid -->
            
	<!-- JQuery Core JavaScript -->
	<script src="<c:url value="/resources/js/jquery.js" />"></script>
	
	 <!-- Bootstrap Core JavaScript -->
	 <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>