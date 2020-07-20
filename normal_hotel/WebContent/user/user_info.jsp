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
#pad2
{
padding-right:10%;
padding-left:10%;
}
p
{
font-size:20px;
color:black;
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
      <a class="nav-item nav-link active" href="./user_info.jsp">个人信息</a>
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
<div id="pad"> 
<div class="alert alert-light">
<h1 class="display-4" id="maya_color">个人信息</h1>
<hr class="featurette-divider">
<div class="text-center">
 <img class="rounded-circle" alt="member" src="../img/img-0cc2b8e4bf8e193e75fa93cef85d8de5.jpg" width="140" height="140">
 </div>
 <hr class="featurette-divider">
 <div id="pad2">
 <div class="row">
 <div class="col"><p><label id="maya_color">姓名</label>：${member.m_name }</p></div>
 <div class="col"><p><label id="maya_color">性别</label>：${member.m_gender }</p></div>
 </div>
 <div class="row">
 <div class="col"><p><label id="maya_color">邮箱</label>：${member.m_email }</p></div> 
 <div class="col"><p><label id="maya_color">注册时间</label>：${member.m_entry }</p></div>
 </div>
 <div class="row">
 <div class="col"><p><label id="maya_color">证件号码</label>：${member.m_paper }</p></div>
  <div class="col"><p><label id="maya_color">家庭地址</label>：${member.m_address }</p></div>
 </div>
 </div>
</div>
</div>
</body>
</html>