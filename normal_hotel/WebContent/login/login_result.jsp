<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <jsp:useBean id="result_fail" class="hotel_data.DataList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
    <link href="./login.css" rel="stylesheet">
    <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>   
<title>N0rmAl_h0te1</title>
<style>
.pad_result
{
padding-top:10%;
padding-right:15%;
padding-left:15%;
padding-bottom:15%;
}
#resulttext
{
	color:black;
}
.button_c
{
width: 100%;
max-width:150px;
margin: 0 auto;
}
</style>
</head>
<body id="mainbody">
<nav class="navbar navbar-dark bg-dark">
  <a class="navbar-brand" href="./login_in.jsp">返回登录</a>
</nav>
<div class="pad_result">
<div class="alert alert-light text-center">
<c:choose>
<c:when test="${result_mark }">
<h2 id="resulttext">${result_type }成功！</h2>
<hr class="featurette-divider">
 <a href="./login_in.jsp"><button class="btn btn-lg btn-outline-primary btn-block button_c" type="button">返回登录</button></a>
</c:when>
<c:otherwise>
<h2 id="resulttext">抱歉，${result_type }失败</h2>
<hr class="featurette-divider">
<p id="resulttext">您可能由于以下原因导致操作失败：</p>
<c:forEach var="rsf" items="${result_fail.list}">
  <h4 class="font-italic" id="resulttext">·${rsf }</h4>
  </c:forEach>
    <hr class="featurette-divider">
   <a href="${backpath }"><button class="btn btn-lg btn-outline-primary btn-block button_c" type="button">返回上一页面</button></a>
</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>