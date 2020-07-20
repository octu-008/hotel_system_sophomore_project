<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="members" class="hotel_data.DataList" scope="session"></jsp:useBean>
<jsp:useBean id="rmembers" class="hotel_data.DataList" scope="session"></jsp:useBean>
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<link href="../bootstrap4/css/bootstrap.min.css" rel="stylesheet">
<link
	href="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.css"
	rel="stylesheet">
<script src="../bootstrap4/jquery-3.2.1.slim.min.js"
	type="text/javascript"></script>
<script src="../bootstrap4/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../bootstrap4/popper.min.js" type="text/javascript"></script>
<script src="../bootstrap4/holder.min.js" type="text/javascript"></script>
<script
	src="../bootstrap4/bootstrap-table-master/dist/bootstrap-table.min.js"
	type="text/javascript"></script>



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
	padding-top: 5px;
}

.paddingb {
	padding-bottom: 13px;
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
		<div>
			<div class="alert alert-light">
				<h2 class="text-right">会员列表</h2>
				<hr class="featurette-divider">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="record-tab" data-toggle="tab" href="#record" role="tab"
						aria-controls="record" aria-selected="true">全部记录</a></li>
					<li class="nav-item"><a class="nav-link" id="search-tab"
						data-toggle="tab" href="#search" role="tab" aria-controls="search"
						aria-selected="false">搜索记录</a></li>
					<li class="nav-item"><a class="nav-link" id="del-tab"
						data-toggle="tab" href="#del" role="tab" aria-controls="del"
						aria-selected="false">删除会员</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active " id="record" role="tabpanel"
						aria-labelledby="record-tab">
						<table class="table" data-toggle="table" data-pagination="true"
							data-height="460" data-page-size="5">
							<thead class="thead-dark">
								<tr>
									<th>姓名</th>
									<th>性别</th>
									<th>注册日期</th>
									<th>密码(未解码)</th>
									<th>会员邮箱</th>
									<th>家庭住址</th>
									<th>会员证件</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${!empty members }">
									<c:forEach var="item_members" items="${members.list }">
										<tr>
											<td>${item_members.m_name}</td>
											<td>${item_members.m_gender}</td>
											<td>${item_members.m_entry}</td>
											<td>${item_members.m_password}</td>
											<td>${item_members.m_email}</td>
											<td>${item_members.m_address}</td>
											<td>${item_members.m_paper}</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>

					</div>
					<div class="tab-pane fade show " id="search" role="tabpanel"
						aria-labelledby="search-tab">
						<div class="px-5 border paddingt">
							<h4>查询</h4>
							<hr class="featurette-divider">
							<div class="px-5 paddingt paddingb">
								<div class="px-5 border">
									<form action="../searchResu.view?rtable=member" method="post">
										<div class="row ">
											<div class="col-4">
												<h4>请选择查询条件：</h4>
											</div>
											<div class="col-8">
												<select name="search_select_cond"
													class="custom-select month">
													<option value="m_name">用户姓名</option>
													<option value="m_email">用户邮箱</option>
													<option value="m_paper">用户证件</option>
												</select>
											</div>
										</div>
										<hr class="featurette-divider">
										<div class="paddingb paddingt">
											<input type="text" name="search_cond" class="form-control"
												placeholder="查询内容">
										</div>
										<div class="paddingb">
											<button type="submit"
												class="btn btn-lg btn-outline-primary btn-block">查询</button>
										</div>
									</form>
									<div class="paddingt border">
										<div class="text-center">
											<h4>查询结果</h4>
											<hr class="featurette-divider">
											<c:choose>
												<c:when test="${rmembers.length!=0 }">
													<table class="table" id="table" data-toggle="table"
														data-pagination="true" data-page-size="5">
														<thead class="thead-dark">
															<tr>
																<th>姓名</th>
																<th>性别</th>
																<th>注册日期</th>
																<th>密码(未解码)</th>
																<th>会员邮箱</th>
																<th>家庭住址</th>
																<th>会员证件</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="ritem_members" items="${rmembers.list }">
																<tr>
																	<td>${ritem_members.m_name}</td>
																	<td>${ritem_members.m_gender}</td>
																	<td>${ritem_members.m_entry}</td>
																	<td>${ritem_members.m_password}</td>
																	<td>${ritem_members.m_email}</td>
																	<td>${ritem_members.m_address}</td>
																	<td>${ritem_members.m_paper}</td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
												</c:when>
												<c:otherwise>
													<div class="alert alert-dark px-5 py-5">
														<h4 class="alert-heading text-center">暂无记录</h4>
													</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
							<div class="tab-pane fade show " id="del" role="tabpanel"
						aria-labelledby="del-tab">
						<div class="px-5 border paddingt paddingb">
						<h4>删除会员</h4>
						<hr class="featurette-divider">
						<form action="../member.e" method="post">
						<div class="px-5 paddingt paddingb">
						<h4>请确认将要被删除会员的信息</h4>
						<hr class="featurette-divider">
						<div class="px-5 paddingt paddingb border">
						<div class="row paddingt paddingb "><input class="form-control" type="text" name="m_name" placeholder="会员姓名" required></div>
						<hr class="featurette-divider">
						<div class="row paddingt paddingb "><input class="form-control" type="text" name="m_paper" placeholder="会员证件" required></div>
						<hr class="featurette-divider">
						<div class="row paddingt paddingb "><input class="form-control" type="text" name="m_email" placeholder="会员邮箱" required></div>
						</div>
						</div>
						<div class="text-center paddingt paddingb ">
						<button class="btn btn-outline-danger" type="submit">删除</button>
						</div>
						</form>
						</div>
						</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>