<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
    <jsp:useBean id="latestNotice" class="hotel_data.Notice" scope="session"></jsp:useBean>
    <jsp:useBean id="historyRecord" class="hotel_data.DataList" scope="session"></jsp:useBean>
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
p{
color:black;
}
#att-border
{
text-align:left!important;
font-size:17px;
padding-left:0.20em;
border-left-style:solid;
border-left-width:10px;
border-left-color:rgb(94,180,243);
}
.paddingt {
	padding-top: 13px;
}

.paddingb {
	padding-bottom: 13px;
}
.notice_text
{
font-size:15px;
color:black;
}
.max_notice
{
height:100%;
max-height:100px;
}
#btc
{
width:100%;
max-width:250;
}
#leftborder
{
text-align:left!important;
color:black;
font-size:17px;
padding-left:0.20em;
border-left-style:solid;
border-left-width:10px;
border-left-color:rgb(147,149,247);
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
     <a class="nav-item nav-link active" href="../record.view?passtype=user">个人主页</a>
     </li>
      <li class="nav-item">
      <a class="nav-item nav-link" href="./user_info.jsp">个人信息</a>
      </li>
       <li class="nav-item">
       <a class="nav-item nav-link " href="./user_hotel_info.jsp">酒店资讯<span class="sr-only">(current)</span></a>
       </li>
       <li class="nav-item">
      <a class="nav-item nav-link" href="../data.view?table=room_detail&room_detail_view=member">客房信息</a>
      </li>
      <li class="nav-item">
      <a class="nav-item nav-link" href="./user_room_info.jsp">客房预订</a>
       </li>
       <li class="nav-item">
      <a class="nav-item nav-link" href="./user_leave_message.jsp">留言建议</a>
       </li>
       </ul>
    </div>
  </div>
  <a href="../logout.do?type=member"><button class="btn btn-outline-danger" type="button">注销</button></a>
</nav>
 <div id="homepad">
 <div class="row">
 <div class="alert alert-light col-3">
 <p id="maya_color"><img class="rounded-circle" alt="member" src="../img/img-0cc2b8e4bf8e193e75fa93cef85d8de5.jpg" width="100" height="100">${member.m_name }</p>
     <div class="text-center">
     <hr class="featurette-divider">
 </div>
 <div class="text-center">
  <p><a href="./user_info.jsp"><button id="btc" class="btn-lg btn-outline-secondary " type="button">查看个人信息</button></a></p>
  <p>
  <a href="../record.view?passtype=record">
  <button id="btc" class="btn-lg btn-outline-secondary " type="button">查看住宿记录
  </button>
  </a></p>
  <p><a href="./user_book_rooms.jsp"><button id="btc" class="btn-lg btn-outline-secondary " type="button">预订房间</button></a></p>
   <p><a href="./user_leave_message.jsp"><button id="btc" class="btn-lg btn-outline-secondary" type="button">留言</button></a></p>
  <p><a href="../logout.do?type=member"><button id="btc" class="btn-lg btn-outline-danger " type="button">注销账号</button></a>
  
 </div>
 </div>
 <div class="col-4">
<div class="alert alert-light ">
<div id="leftborder">最新通知</div>
<div>
           <div class="px-1 border paddingb notice_text">
           <div class="paddingt">${latestNotice.n_tittle}</div>
  <hr class="featurette-divider">
  <div class="max_notice">${latestNotice.n_content}</div>
  <hr class="featurette-divider">
  <div class="text-right">
  <div>${latestNotice.author }</div>
  <div>${latestNotice.n_date } </div>
  </div>
  </div>
  </div>

</div>
<hr class="featurette-divider">
<div class="alert alert-light">
<div id="leftborder">住宿记录</div>
<div class="px-1 paddingb border">
<table class="table" data-toggle="table" data-pagination="true"  data-page-size="5">
<thead>
<tr>
<th scope="col">入住房间号</th>
<th scope="col">入住时间</th>
</tr>
</thead>
<tbody>
<c:if test="${historyRecord.length>=1 }">
<tr>
<td>${historyRecord.list[0].room_id }</td>
<td>${historyRecord.list[0].register_time }</td>
</tr>
</c:if>
<c:if test="${historyRecord.length>=2 }">
<tr>
<td>${historyRecord.list[1].room_id }</td>
<td>${historyRecord.list[1].register_time }</td>
</tr>
</c:if>
</tbody>
</table>
</div>
<div class="text-right">
<a id="maya_color" href="../record.view?passtype=record">查看记录详情</a>
</div>
</div>
 </div>
<div class="alert alert-light col-5">
<div id="leftborder">酒店资讯</div>
<img class="" alt="member" src="../images/hotel_info_1.png" width="450" height="220">
<img class="" alt="member" src="../images/hotel_info_2.png" width="450" height="210">
</div>
 </div>
 </div>
</body>
</html>