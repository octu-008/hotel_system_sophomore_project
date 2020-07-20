<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
          <jsp:useBean id="room_detail" class="hotel_data.Room_detail" scope="session"></jsp:useBean>
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
.pad3
{
padding-right:5%;
padding-left:5%;
}
.custom-select
{
width:100%;
max-width:150px;
}
#detailpad
{
paddin-top:5%;
padding-right:5%;
padding-left:5%;
}
#btc
{
width:100%;
max-width:250;
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
      <a class="nav-item nav-link active" href="./user_book_rooms.jsp">客房预订</a>
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
<h1 class="display-4" id="maya_color">客房预订</h1>
<hr class="featurette-divider">
<c:choose>
<c:when test="${ room_detail.type!=null}">
<form action="../bookConfirm.do" method="post">
<div class="pad3 border">
<div class="row">
<div class="col-9"><h3 >输入联系人信息</h3></div>
<div class="col-3"><a href="../cancel.do"><button class="btn btn btn-outline-danger" type="button">取消订单</button></a></div>
</div>
 <hr class="featurette-divider">
 <div class="row">
 <div class="col"><p>姓名：${member.m_name }</p></div>
 <div class="col"><p>性别：${member.m_gender }</p></div>
 </div>
 <div class="row">
 <div class="col"><p>证件号码：${member.m_paper }</p></div>
 </div>
  <div class="row">
 <div class="col-9"><p>家庭地址：${member.m_address }</p></div>
 </div>
  <div class="row">
 <div class="col-9"><p>邮箱：${member.m_email }</p></div>
 </div>
</div>
 <hr class="featurette-divider">
<div class="pad3 border">
<h3 >预订详细</h3>
 <hr class="featurette-divider">
 <div class="row">
 <div class="col-6">
 <h4>填写同行入住者信息</h4>
  <hr class="featurette-divider">
  <p>同行者1：</p>
  <input type="text" name="aibo_name_1" class="form-control" placeholder="姓名">
    <hr class="featurette-divider">
  <input type="text" name="aibo_paper_1" class="form-control" placeholder="联系方式或身份证号码">
  <hr class="featurette-divider">
  <p>同行者2：</p>
  <input type="text" name="aibo_name_2" class="form-control" placeholder="姓名">
    <hr class="featurette-divider">
  <input type="text" name="aibo_paper_2" class="form-control" placeholder="联系方式或身份证号码">
  <hr class="featurette-divider">
  <p>*若您没有同行者，可以选择不填该项信息</p> 
  <hr class="featurette-divider">
 
   <h4>备注</h4>
    <hr class="featurette-divider">
    <textarea  name="memo" rows="3" cols="45"></textarea>
    <p>*若您有其他需求或其他说明请填写</p>
 </div>
 <div class="col-6 alert alert-secondary">
 <div class="text-center">
 <h4>预定房间信息</h4>
 <hr class="featurette-divider">
 <img class="rounded" src="${room_detail.img_path }" width="195" height="130"></div>
   <div id="detailpad">
    <p>房间名称：${room_detail.room_name  }</p>
    <p>人数限制（单间）：${room_detail.person  } 人</p>
    <p>房间价格(单间/晚)：${room_detail.price  } 元</p>
    <p>房间配置：${room_detail.factor  }</p>
    <p>餐饮配置：${room_detail.meal }</p>
    <p>入住日期： ${i_date }</p>
    <p>退房日期： ${q_date }</p>
    <p>预订房间数：${num } 间</p>
    <p>住宿天数：${days } 天</p>
    <p>预计总花费： ${num*days*room_detail.price } 元</p>
  </div>
 </div>
 </div>
 </div>

  <hr class="featurette-divider">
 <div class="pad3 border">
 <h3 >结算</h3>
 <hr class="featurette-divider">
 <div class="text-center">
 <h4>合计金额：</h4>
 <h3>${num*days*room_detail.price } 元</h3>
   <hr class="featurette-divider">
   <button id="btc" class="btn btn-outline-secondary" type="submit"> 确认预订</button>
   <hr class="featurette-divider">
 </div>
 </div>
 </form>
</c:when>
<c:otherwise>
<div class="alert alert-light text-center" id="black_text">
<h2>请先在房间信息中选择您要预订的房间！</h2>
  <hr class="featurette-divider">
  <div class="row">
  <div class="col text-center">
  <a href="../record.view?passtype=record"><button class="btn btn-outline-secondary" type="button">查看住宿记录</button></a>
  </div>
  <div class="col text-center">
  <a href="../data.view?table=room_detail&room_detail_view=member"><button class="btn btn-secondary" type="button">查看房间信息</button></a>
  </div>
  </div>
</div>
</c:otherwise>
</c:choose>

</div>
</div>
</body>
</html>