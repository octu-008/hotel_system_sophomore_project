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
      <link
	href="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.css"
	rel="stylesheet">
        <script src="../bootstrap4/jquery-3.2.1.slim.min.js" type="text/javascript"></script>
    <script src="../bootstrap4/js/bootstrap.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/popper.min.js"  type="text/javascript"></script>
    <script src="../bootstrap4/holder.min.js"  type="text/javascript"></script>
    <script
	src="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.js"
	type="text/javascript"></script>
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
      <a class="nav-item nav-link " href="./user_info.jsp">个人信息</a>
      </li>
       <li class="nav-item">
       <a class="nav-item nav-link active" href="./user_hotel_info.jsp">酒店资讯<span class="sr-only">(current)</span></a>
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
<h1 class="display-4" id="maya_color">酒店资讯</h1>
<hr class="featurette-divider">

<div class="px-5 paddingb">
<h4>交通资讯</h4>

<table class="table table-striped border" >
<tbody>
<tr>
<th>高速客车中央高速137C站～徒步（约12分钟）或者乘出租车（约5分钟）<br><br>
※关于接送服务(2019.03更新)<br>[从车站→酒店]<br>・上车地点：137C站(15:00～20:00)※2名以上即可提供接送服务。由于巴士无法事前停靠在137C站，请在抵达车站后拨电话给酒店(服务人​​员会以英语或汉语对应)。
<br>[从酒店→车站]<br>・137C站(7:30～10:00) ※2名以上即可提供接送服务。需事前在当地预约。
<br>※注意事项：<br>・如果在办理入住手续时间前、或于供餐时段(17:00)以后抵达酒店，有可能无法提供接送服务，敬请注意。</th>

</tr>
</tbody>
</table>
</div>

<div class="px-5 paddingb">
<h4>设备与服务</h4>

<table class="table table-striped border" >
<tbody>
<tr>
<th scope="row">娱乐设施</th>
<td>台球，酒吧</td>
</tr>
<tr>
<th scope="row">网络</th>
<td>免费，LAN连续环境，无线上网</td>
</tr>
<tr>
<th scope="row">交通资讯与停车场</th>
<td>送迎服务（需要事前预约）, 有送迎服务, , 免费停车场</td>
</tr>
<tr>
<th scope="row">其他设备</th>
<td>投币式洗衣机</td>
</tr>
</tbody>
</table>
</div>

<div class="px-5">
<h4>浴室</h4>
<table class="table table-striped border" >
<tbody>
<tr>
<th scope="row">大浴场</th>
<td>有大浴场</td>
</tr>
<tr>
<th scope="row">其他洗浴设施</th>
<td>桑拿，单间独立浴室</td>
</tr>
</tbody>
</table>

</div>

<div class="px-5">
<h4>周边设施</h4>
<table class="table table-striped border" >
<tbody>
<tr>
<th scope="row">周边运动设施</th>
<td>溜冰, 钓鱼, 帆船</td>
</tr>
</tbody>
</table>
</div>

<div class="px-5">
<h4>其他资讯</h4>
<table class="table table-striped border" >
<tbody>
<tr>
<th scope="row">外语服务</th>
<td>汉语，英语，法语，德语，俄罗斯语</td>
</tr>
<tr>
<th scope="row">轮椅利用</th>
<td>有出租用轮椅, 轮椅对应</td>
</tr>
</tbody>
</table>
</div>

<div class="px-5">
<h4>接受信用卡种类</h4>
<table class="table table-striped border" >
<tbody>
<tr>
<th scope="row">其他可接受信用卡种类</th>
<td>三菱UFJ Nicos信用卡(MUFG/DC/UFJ/NICOS), 万事达卡（MasterCard）</td>
</tr>
</tbody>
</table>
</div>

</div>
</div>

</body>
</html>