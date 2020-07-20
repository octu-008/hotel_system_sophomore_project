<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <jsp:useBean id="member" class="hotel_data.Member" scope="session"></jsp:useBean>
         <jsp:useBean id="historyRecord" class="hotel_data.DataList" scope="session"></jsp:useBean>
         <jsp:useBean id="bookRecord" class="hotel_data.DataList" scope="session"></jsp:useBean>
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
  <div id="pad"> 
  <div class="alert alert-light">
  <h1 class="display-4" id="maya_color">住宿记录</h1>
   <hr class="featurette-divider">
   
   <ul class="nav nav-tabs" id="myTab" role="tablist">
  <li class="nav-item">
    <a class="nav-link active" id="booking-tab" data-toggle="tab" href="#booking" role="tab" aria-controls="booking" aria-selected="true">预定中</a>
  </li>
  <li class="nav-item">
  <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">历史入住记录</a>
  </li>
    <li class="nav-item">
  <a class="nav-link" id="booked-tab" data-toggle="tab" href="#booked" role="tab" aria-controls="booked" aria-selected="false">历史预订记录</a>
  </li>
</ul>

   <div class="tab-content" id="myTabContent">
   <div class="tab-pane fade show active text-center" id="booking" role="tabpanel" aria-labelledby="book-tab">
   <table class="table">
   <thead class="thead-dark">
   <tr>
   <th scope="col">预订房间号</th>
   <th scope="col">预订人</th>
   <th scope="col">预订入住日期</th>
   <th scope="col">预订退房日期</th>
   <th scope="col"></th>
   </tr>
   </thead>
   <tbody>
   <c:if test="${!empty bookRecord }">
   <c:forEach var="item_bookinfo" items="${bookRecord.list }" >
   <c:if test="${item_bookinfo.book_state eq '预订中'  }">
   <tr>
   <td>${item_bookinfo.room_id }</td>
   <td>${item_bookinfo.c_name}</td>
   <td>${item_bookinfo.book_in_time }</td>
   <td>${item_bookinfo.book_quit_time }</td>
   <td><form action="../checkOut.do?recor_num=${item_bookinfo.record_num }&room_id=${item_bookinfo.room_id }" method="post"><button class="btn btn-outline-danger" type="submit">退房</button></form></td>
   </tr>
   </c:if>
   </c:forEach>
   </c:if>
   </tbody>
   </table>

   </div>
   <div class="tab-pane fade show text-center" id="history" role="tabpanel" aria-labelledby="history-tab">
      <table class="table">
   <thead class="thead-dark">
   <tr>
   <th scope="col">房间号</th>
   <th scope="col">入住人</th>
   <th scope="col">入住时间</th>
   <th scope="col">退房时间</th>
   <th scope="col">客户类型</th>
   <th scope="col">入住天数</th>
   <th scope="col">花费</th>
   </tr>
   </thead>
   <tbody>
   <c:if test="${!empty historyRecord }">
   <c:forEach var="item_historyinfo" items="${historyRecord.list }" >
   <tr>
   <td>${item_historyinfo.room_id }</td>
   <td>${item_historyinfo.c_name}</td>
   <td>${item_historyinfo.register_time }</td>
   <td>${item_historyinfo.settle_time }</td>
   <td>${item_historyinfo.c_type }</td>
   <td>${item_historyinfo.days }</td>
   <td>${item_historyinfo.cost }</td>
   </tr>
   </c:forEach>
   </c:if >
   </tbody>
   </table>
       <hr class="featurette-divider">
   <div class="text-right">您在本店已花费了：${totalPrice } 元</div>
   </div>
    <div class="tab-pane fade show text-center" id="booked" role="tabpanel" aria-labelledby="history-tab">
     <table class="table">
     <thead class="thead-dark">
   <tr>
   <th scope="col">预订房间号</th>
   <th scope="col">预订人</th>
   <th scope="col">预订入住日期</th>
   <th scope="col">预订退房日期</th>
   <th scope="col">状态</th>
   </tr>
   </thead>
   <tbody>
      <c:if test="${!empty bookRecord }">
       <c:forEach var="item_bookinfo" items="${bookRecord.list }" >
       <c:if test="${!(item_bookinfo.book_state eq '预订中')  }">
       <tr>
   <td>${item_bookinfo.room_id }</td>
   <td>${item_bookinfo.c_name}</td>
   <td>${item_bookinfo.book_in_time }</td>
   <td>${item_bookinfo.book_quit_time }</td>
    <td>${item_bookinfo.book_state }</td>
   </tr>
       </c:if>
       </c:forEach>
      </c:if>
   </tbody>
     </table>
    </div>
   </div>
  </div>
  </div>
</body>
</html>