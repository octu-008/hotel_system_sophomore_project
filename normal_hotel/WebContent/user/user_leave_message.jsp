<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
        <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
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
#pad3
{
padding-right:20%;
padding-left:20%;
}
p
{
font-size:17px;
}
 .form-signin {
  width: 100%;
  max-width:500px;
  padding: 15px;
  margin: 0 auto;
}
.form-signin .btn
{
   width: 100%;
  max-width:200px;
  margin: 0 auto;
    padding-top: 5px;
}
.form-signin .form-control
{
   width: 100%;
  max-width:300px;
    margin: 0 auto;
}
#maya_color
{
	color:rgb(146,149,247);
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
      <a class="nav-item nav-link active" href="./user_room_info.jsp">留言建议</a>
       </li>
       </ul>
    </div>
  </div>
  <a href="../logout.do?type=member"><button class="btn btn-outline-danger" type="button">注销</button></a>
</nav>

<div id="pad"> 
<div class="alert alert-light">
<h1 class="display-4" id="maya_color">留言建议</h1>
<hr class="featurette-divider">
<form action="../leaveMessage.do" method="post" class="form-signin text-center">
<textarea  name="message" rows="5" cols="60" required autofocus></textarea>
<p id="black_text">感谢您的建议，请留下您的联系方式以便我们可以及时反馈。</p>
<input type="text" name="contact" class="form-control"  placeholder="联系方式" required autofocus>
<br>
<button class="btn btn-lg btn-outline-secondary btn-block" type="submit">提交</button>
</form>
</div>
</div>
</body>
</html>