<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
        <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>
<meta charset="ISO-8859-1">
<style>
#mainbody
{
background-color:gray;
}
#pad
{
padding-right:15%;
padding-left:15%;
}
</style>
<title>Insert title here</title>
</head>
<body id="mainbody">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">你好，用户</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
     <ul class="navbar-nav">
      <li>
     <a class="nav-item nav-link" href="./user_home.jsp">个人主页</a>
     </li>
      <li class="nav-item">
      <a class="nav-item nav-link" href="./user_info.jsp">个人信息</a>
      </li>
       <li class="nav-item">
       <a class="nav-item nav-link " href="./user_hotel_info.jsp">酒店资讯<span class="sr-only">(current)</span></a>
       </li>
       <li class="nav-item">
      <a class="nav-item nav-link" href="./user_room_info.jsp">客房信息</a>
      </li>
      <li class="nav-item">
      <a class="nav-item nav-link " href="./user_book_rooms.jsp">客房预订</a>
       </li>
       </ul>
    </div>
  </div>
  <button class="btn btn-outline-danger" type="submit">注销</button>
</nav>

<div id="pad"> 
<div class="alert alert-light">
<h1 class="text-center display-5">标题</h1>
<hr class="featurette-divider">
<p class="text-center">发表于 2019年5月12日 by boss</p>
</div>
</div>

</body>
</html>