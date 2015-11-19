<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<body>
    <table style="height: 10px; width: 775px;" border="1">
        <tr>
        <th>NSU</th>
        <th>Número Cartão</th>
        <th>Adquirente</th>
        <th>Bandeira</th>
        <th>Produto</th>
        <th>Valor</th>
        <th>Data</th>
        <th>Hora</th>
        <th>Status</th>
        </tr>

        <c:forEach items="${historicos}" var="historico">
        <tr>
            <td>${historico.codNSU}</td>
            <td>${historico.numCartao}</td>
            <td>${historico.adquirente}</td>
            <td>${historico.bandeiraId}</td>
            <td>${historico.produto}</td>
            <td>${historico.valor}</td>
            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="dd/MM/yyyy"/></td>
            <td><fmt:formatDate value="${historico.dataTransacao}" pattern="hh:mm:ss"/></td>
            <td>${historico.descricaoResposta}</td>
        </tr>        
        </c:forEach>
        
        
    </table>

</body>
</html>