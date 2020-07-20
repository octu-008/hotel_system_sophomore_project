<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
      <jsp:useBean id="result_fail" class="hotel_data.DataList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
    <link href="./user.css" rel="stylesheet">
    <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>   
<title>N0rmAl_h0te1</title>
<style>
.button_c
{
width: 100%;
max-width:150px;
margin: 0 auto;
}
</style>
</head>
<body id="mainbody">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">你好，${member.m_name }</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarCollapse">
    <div class="navbar-nav">
     <ul class="navbar-nav">
      <li>
     <a class="nav-item nav-link" href="../record.view?passtype=user">个人主页</a>
     </li>
      <li class="nav-item">
      <a class="nav-item nav-link" href="./user_info.jsp">个人信息</a>
      </li>
       <li class="nav-item">
       <a class="nav-item nav-link " href="./user_hotel_info.jsp">酒店资讯<span class="sr-only">(current)</span></a>
       </li>
       <li class="nav-item">
      <a class="nav-item nav-link " href="../data.view?table=room_detail&room_detail_view=member">客房信息</a>
      </li>
      <li class="nav-item">
      <a class="nav-item nav-link" href="./user_book_rooms.jsp">客房预订</a>
       </li>
         <li class="nav-item">
      <a class="nav-item nav-link" href="./user_leave_message.jsp">留言建议</a>
       </li>
       </ul>
    </div>
  </div>
  <a href="../logout.do?type=member"><button class="btn btn-outline-danger" type="button">注销</button></a>
</nav>
<div id="pad_reuslt">
<div class="alert alert-light text-center" id="black_text">
<c:choose>
<c:when test="${result_mark}">
<h2>${result_type }成功！</h2>
<hr class="featurette-divider">
<a href="${backpath }"><button class="btn btn-lg btn-outline-primary btn-block button_c" type="button">返回</button></a>
</c:when>
<c:otherwise>
<h2>抱歉，${result_type }失败</h2>
<hr class="featurette-divider">
<p>您可能由于以下原因导致操作失败：</p>
<c:forEach var="rsf" items="${result_fail.list}">
  <h4 class="font-italic">·${rsf }</h4>
  </c:forEach>
  <hr class="featurette-divider">
  <a href="${backpath }"><button class="btn btn-lg btn-outline-primary btn-block button_c" type="button">返回上一页面</button></a>
</c:otherwise>
</c:choose>
</div>
</div>
</body>
</html>