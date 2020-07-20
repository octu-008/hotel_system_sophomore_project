<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>

<!DOCTYPE html>
<html>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
        <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>
    
<title>N0rmAl_h0te1</title>
<style>
#pad
{
padding-right:10%;
padding-left:10%;
}
#cradtest
{
width:10rem;
height:10rem;
}
</style>
<body>
<header>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">请管理员认真工作</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
  <span class="navbar-toggler-icon"></span>
  </button>
   <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
    <div class="navbar-nav">
     <ul class="navbar-nav">
      <li>
       <a class="nav-item nav-link active" href="./admin_menu.jsp">主菜单</a>
      </li>
      <li class="nav-item active dropdown">
       <a class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" href="#">管理功能</a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
         <a class="dropdown-item" href="../data.view?table=notice">通知管理</a>
         <a class="dropdown-item" href="../data.view?table=book_info">预订管理</a>
         <a class="dropdown-item" href="../data.view?table=checkin_info">入住管理</a>
         <a class="dropdown-item" href="../data.view?table=member">会员/账户管理</a>
         <a class="dropdown-item" href="../data.view?table=bill">账单管理</a>
         <a class="dropdown-item" href="../data.view?table=message">留言管理</a>
       </div>
      </li>
     </ul>
    </div>
    </div> 
  <a href="../logout.do?type=admin"><button class="btn btn-outline-danger" type="button">注销</button></a>
 </nav>
</header>
<div id="pad">
 <h2 class="text-center">！请认真工作！big boss is watching you！</h2>
 <hr class="featurette-divider">
 <div class="row">
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_notice.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">通知管理</h5>
     <p class="card-text">以管理员的名义发布酒店的最新通知，查看通知的历史记录。<br></p>
     <a href="../data.view?table=notice" class="btn btn-primary">前往</a>
    </div>
  </div>
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_bookmag.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">预订管理</h5>
     <p class="card-text">管理顾客的预订信息，确认顾客的入住和退房时间或是让顾客在前台预订房间。<br></p>
     <a href="../data.view?table=book_info" class="btn btn-primary">前往</a>
    </div>
  </div>
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_accommodation.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">入住管理</h5>
     <p class="card-text">管理入住人员的信息，查看所有房间信息的状态信息。<br></p>
     <a href="../data.view?table=checkin_info" class="btn btn-primary">前往</a>
    </div>
  </div>
 </div>
 <div class="row">
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_usermag.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">会员列表</h5>
     <p class="card-text">查看登记会员的信息或是删除会员。<br><br></p>
     <a href="../data.view?table=member" class="btn btn-primary">前往</a>
    </div>
  </div>
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_billmag.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">账单管理</h5>
     <p class="card-text">确认消费记录，统计账单金额。<br><br></p>
     <a href="../data.view?table=bill" class="btn btn-primary">前往</a>
    </div>
  </div>
  <div class="card col-4" id="cardtest">
   <img alt="2" src="../images/admin_message.png" width="300" height="80">
    <div class="card-body">
     <h5 class="card-title">留言管理</h5>
     <p class="card-text">查看顾客留言，或是删除留言。<br><br></p>
     <a href="../data.view?table=message" class="btn btn-primary">前往</a>
    </div>
  </div>
 </div>
 
</div>
</body>
</html>