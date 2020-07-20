<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
        <jsp:useBean id="room_details" class="hotel_data.DataList" scope="session"></jsp:useBean>
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
p
{
color:black;
}
#pad
{
padding-right:15%;
padding-left:15%;
}
.custom-select
{
width:100%;
max-width:80px;
}
#month
{
width:100%;
max-width:60px;
}
#day
{
width:100%;
max-width:60px;
}
#maya_color_1
{
color:rgb(147,149,247);
font-size:30px;
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
      <a class="nav-item nav-link active" href="../data.view?table=room_detail&room_detail_view=member">客房信息</a>
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
<h1 class="display-4" id="maya_color">客房信息</h1>
<hr class="featurette-divider">

 <c:forEach var="item_roomDetail" items="${room_details.list }">
  <div class="row">
    <div class="col">
    <img class="rounded text-left" alt="boss" src="${item_roomDetail.img_path }" width="390" height="260">
    <p>基础配置 ： ${item_roomDetail.factor}<br></p>
    <p>有关儿童入住规定:接受儿童入住<br></p>
    <p>眺望： 都市盛景<br></p>
     <c:if test="${item_roomDetail.type eq '001' }">
            <p> 面积： 10.409 平方米</p>
     </c:if>
      <c:if test="${item_roomDetail.type eq '002' }">
    <p>          面积： 15.488 平方米</p>
     </c:if>
     <c:if test="${item_roomDetail.type eq '003' }">
           <p>   面积： 27.104 平方米</p>
     </c:if>
    </div>
    <div class="col">
    <h4 id="maya_color">${item_roomDetail.room_name}</h4>
    <hr class="featurette-divider">
     <p>人数上限：${item_roomDetail.person }人/间 </p>
     <p>餐食：${ item_roomDetail.meal}</p>
     <p>付款方式：当地酒店付款</p>  
     <p>剩余房间：<label id="maya_color_1">
     <c:if test="${item_roomDetail.type eq '001' }">
     ${room_0010_num }
     </c:if>
      <c:if test="${item_roomDetail.type eq '002' }">
     ${room_0020_num }
     </c:if>
     <c:if test="${item_roomDetail.type eq '003' }">
     ${room_0030_num }
     </c:if>
     </label>间</p>
     <form action="../preBook.view?roomtype=${item_roomDetail.type }"  method="post">
     <p>入住日期：</p>
  <p>年：
  <select name="i_year" class="custom-select">
  <option value="2019">2019</option>
  </select>
       月：
  <select name="i_month" class="custom-select month" id="month">
  <option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
  </select>日：
  <select name="i_day" class="custom-select" id="day">
  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
  </select>
  </p>
<p>退房日期：</p>
  <p>年：
  <select name="q_year" class="custom-select">
  <option value="2019">2019</option>
  </select>
       月：
  <select name="q_month" class="custom-select month" id="month">
  <option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
  </select>日：
  <select class="custom-select"  name="q_day"  id="day">
  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
  </select>
  </p>
  <hr class="featurette-divider">
      <p>房间数： 
 <select  name="num" class="custom-select">
 <option value="1">1</option>
 <option value="2">2</option>
 <option value="3">3</option>
 </select>
   <hr class="featurette-divider">
<button class="btn btn-lg btn-outline-secondary btn-block" type="submit">去预订</button>
     </form>
    </div>
  </div>
  <hr class="featurette-divider">
 </c:forEach>


</div>
</div>

</body>
</html>