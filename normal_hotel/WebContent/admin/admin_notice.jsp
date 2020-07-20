<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="notices" class="hotel_data.DataList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link href="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.css" rel="stylesheet">
<script src="../bootstrap4/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<script src="../bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../bootstrap4/popper.min.js" type="text/javascript"></script>
<script src="../bootstrap4/holder.min.js" type="text/javascript"></script>
<script src="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.js"  type="text/javascript"></script>
<title>N0rmAl_h0te1</title>
<style>
#pad {
	padding-right: 5%;
	padding-left: 5%;
}

#cradtest {
	width: 10rem;
	height: 10rem;
}

.paddingt {
	padding-top: 13px;
}

.paddingb {
	padding-bottom: 13px;
}
#buttonP
{
width:100%;
max-width:200px;
}
#inputP
{
margin-left:auto;
margin-right:auto;
width:100%;
max-width:600px;
}
</style>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
			<a class="navbar-brand" href="#">请各位管理员认真工作</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav">
					<ul class="navbar-nav">
						<li><a class="nav-item nav-link active"
							href="./admin_menu.jsp">主菜单</a></li>
						<li class="nav-item active dropdown"><a
							class="nav-link dropdown-toggle" id="navbarDropdown"
							role="button" data-toggle="dropdown" aria-haspopup="true"
							aria-expanded="false" href="#">管理功能</a>
							<div class="dropdown-menu" aria-labelledby="navbarDropdown">
								<a class="dropdown-item" href="../data.view?table=notice">通知管理</a>
								<a class="dropdown-item" href="../data.view?table=book_info">预订管理</a>
								<a class="dropdown-item" href="../data.view?table=checkin_info">入住管理</a>
								<a class="dropdown-item" href="../data.view?table=member">会员/账户管理</a>
								<a class="dropdown-item" href="../data.view?table=bill">账单管理</a>
								<a class="dropdown-item" href="../data.view?table=message">留言管理</a>
							</div></li>
					</ul>
				</div>
			</div>
			<a href="../logout.do?type=admin"><button
					class="btn btn-outline-danger" type="button">注销</button></a>
		</nav>
	</header>

	<div id="pad">

		<div class="alert alert-light">
			<h2 class="text-right">通知管理</h2>
			<hr class="featurette-divider">

 <ul class="nav nav-tabs" id="myTab" role="tablist">
<li class="nav-item">
    <a class="nav-link active" id="publish-tab" data-toggle="tab" href="#publish" role="tab" aria-controls="publish" aria-selected="true">发布新通知</a>
  </li>
<li class="nav-item">
    <a class="nav-link" id="history-tab" data-toggle="tab" href="#history" role="tab" aria-controls="history" aria-selected="false">查看历史通知</a>
  </li>
</ul>

<div class="tab-content" id="myTabContent">
<div class="tab-pane fade show active " id="publish" role="tabpanel" aria-labelledby="publish-tab">
			<div class="px-5 border paddingb paddingt">
				<h4>发布新通知</h4>
				<form action="../notice.create" method="post">
				<hr class="featurette-divider">
				<div class="px-5 border paddingt paddingb">
					<div class="text-center ">
						<input id="inputP" name="tittle" type="text" class="form-control" placeholder="通知标题" required>
					</div>
					<div class="text-center paddingb paddingt">
						<textarea name="noticeContent" rows="5" cols="80" placeholder="通知内容" required></textarea>
					</div>

					<div class="text-center paddingb">
						<button id="buttonP" class="btn btn-lg btn-outline-primary"
							type="submit">发布</button>
					</div>
				</div>
				</form>
			</div>
			</div>
<div class="tab-pane fade show " id="history" role="tabpanel" aria-labelledby="history-tab">
			<div class="px-5 border paddingt paddingb ">
			<h4>查看历史通知</h4>
			<hr class="featurette-divider">
			<table class="table" data-toggle="table" data-pagination="true"  data-page-size="5">
  <thead>
  <tr>
  <th scope="col">通知编号#</th>
   <th scope="col">通知详情</th>
  </tr>
  </thead>
			<tbody>
			<c:forEach var="history" items="${notices.list }">
			<tr>
			<td># ${history.record}</td>
			<td>
			           <div class="paddingb paddingt">
           <div class="px-2 border paddingb paddingt">
           <div class="row">
  <div class="col">${history.n_tittle}</div>
  </div>
  <hr class="featurette-divider">
  <div>${history.n_content}</div>
  <hr class="featurette-divider">
  <div class="text-right">
  <p>${history.author }
  <p>${history.n_date } 
  </div>
  </div>
  </div>
			</td>
			</tr>
			</c:forEach>
			</tbody>
			</table>
			
			</div>
			</div>
			</div>
		</div>
	</div>

</body>
</html>