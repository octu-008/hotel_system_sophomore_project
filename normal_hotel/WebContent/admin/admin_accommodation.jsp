<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="checkin_infos" class="hotel_data.DataList"
	scope="session"></jsp:useBean>
<jsp:useBean id="rcheckin_infos" class="hotel_data.DataList"
	scope="session"></jsp:useBean>
<jsp:useBean id="room_infos" class="hotel_data.DataList" scope="session"></jsp:useBean>
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
<script src="../bootstrap4/js/bootstrap-table.js" type="text/javascript"></script>
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
				<h2 class="text-right">入住管理</h2>
				<hr class="featurette-divider">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="record-tab" data-toggle="tab" href="#record" role="tab"
						aria-controls="record" aria-selected="true">入住记录</a></li>
					<li class="nav-item"><a class="nav-link" id="search-tab"
						data-toggle="tab" href="#search" role="tab" aria-controls="search"
						aria-selected="false">搜索记录</a></li>
					<li class="nav-item"><a class="nav-link" id="manage-tab"
						data-toggle="tab" href="#manage" role="tab" aria-controls="manage"
						aria-selected="false">记录管理</a></li>
					<li class="nav-item"><a class="nav-link" id="roominfo-tab"
						data-toggle="tab" href="#roominfo" role="tab"
						aria-controls="roominfo" aria-selected="false">房间信息</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active " id="record" role="tabpanel"
						aria-labelledby="record-tab">
						<div class="px-5 border">
							<h4>记录</h4>
							<hr class="featurette-divider">

							<ul class="nav nav-tabs" id="myTab" role="tablist">
								<li class="nav-item"><a class="nav-link active"
									id="tol-tab" data-toggle="tab" href="#tol" role="tab"
									aria-controls="tol" aria-selected="true">所有记录</a></li>
								<li class="nav-item"><a class="nav-link" id="stayIn-tab"
									data-toggle="tab" href="#stayIn" role="tab"
									aria-controls="stayIn" aria-selected="false">入住中</a></li>
								<li class="nav-item"><a class="nav-link"
									id="quitOntime-tab" data-toggle="tab" href="#quitOntime"
									role="tab" aria-controls="quitOntime" aria-selected="false">按时退房</a></li>
								<li class="nav-item"><a class="nav-link"
									id="quitMidway-tab" data-toggle="tab" href="#quitMidway"
									role="tab" aria-controls="quitMidway" aria-selected="false">中途退房</a></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active " id="tol" role="tabpanel"
									aria-labelledby="tol-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">记录编号</th>
												<th scope="col">入住房间号</th>
												<th scope="col">入住人员姓名</th>
												<th scope="col">入住人员证件号码</th>
												<th scope="col">入住时间</th>
												<th scope="col">预订入住天数</th>
												<th scope="col">订金</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_checkin_infos"
												items="${checkin_infos.list }">
												<tr>
													<td>${item_checkin_infos.record }</td>
													<td>${item_checkin_infos.room_id }</td>
													<td>${item_checkin_infos.c_name }</td>
													<td>${item_checkin_infos.c_paper }</td>
													<td>${item_checkin_infos.ci_time }</td>
													<td>${item_checkin_infos.ci_days }</td>
													<td>${item_checkin_infos.ci_deposit }</td>
													<td>${item_checkin_infos.ci_state }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade show " id="stayIn" role="tabpanel"
									aria-labelledby="stayIn-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">记录编号</th>
												<th scope="col">入住房间号</th>
												<th scope="col">入住人员姓名</th>
												<th scope="col">入住人员证件号码</th>
												<th scope="col">入住时间</th>
												<th scope="col">预订入住天数</th>
												<th scope="col">订金</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_checkin_infos"
												items="${checkin_infos.list }">
												<c:if test="${item_checkin_infos.ci_state eq '入住中' }">
													<tr>
														<td>${item_checkin_infos.record }</td>
														<td>${item_checkin_infos.room_id }</td>
														<td>${item_checkin_infos.c_name }</td>
														<td>${item_checkin_infos.c_paper }</td>
														<td>${item_checkin_infos.ci_time }</td>
														<td>${item_checkin_infos.ci_days }</td>
														<td>${item_checkin_infos.ci_deposit }</td>
														<td>${item_checkin_infos.ci_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade show " id="quitOntime" role="tabpanel"
									aria-labelledby="quitOntime-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">记录编号</th>
												<th scope="col">入住房间号</th>
												<th scope="col">入住人员姓名</th>
												<th scope="col">入住人员证件号码</th>
												<th scope="col">入住时间</th>
												<th scope="col">预订入住天数</th>
												<th scope="col">订金</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_checkin_infos"
												items="${checkin_infos.list }">
												<c:if test="${item_checkin_infos.ci_state eq '按时退房' }">
													<tr>
														<td>${item_checkin_infos.record }</td>
														<td>${item_checkin_infos.room_id }</td>
														<td>${item_checkin_infos.c_name }</td>
														<td>${item_checkin_infos.c_paper }</td>
														<td>${item_checkin_infos.ci_time }</td>
														<td>${item_checkin_infos.ci_days }</td>
														<td>${item_checkin_infos.ci_deposit }</td>
														<td>${item_checkin_infos.ci_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>

								</div>
								<div class="tab-pane fade show " id="quitMidway" role="tabpanel"
									aria-labelledby="quitMidway-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">记录编号</th>
												<th scope="col">入住房间号</th>
												<th scope="col">入住人员姓名</th>
												<th scope="col">入住人员证件号码</th>
												<th scope="col">入住时间</th>
												<th scope="col">预订入住天数</th>
												<th scope="col">订金</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_checkin_infos"
												items="${checkin_infos.list }">
												<c:if test="${item_checkin_infos.ci_state eq '中途退房' }">
													<tr>
														<td>${item_checkin_infos.record }</td>
														<td>${item_checkin_infos.room_id }</td>
														<td>${item_checkin_infos.c_name }</td>
														<td>${item_checkin_infos.c_paper }</td>
														<td>${item_checkin_infos.ci_time }</td>
														<td>${item_checkin_infos.ci_days }</td>
														<td>${item_checkin_infos.ci_deposit }</td>
														<td>${item_checkin_infos.ci_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>

							</div>
						</div>
					</div>
					<div class="tab-pane fade show " id="search" role="tabpanel"
						aria-labelledby="search-tab">
						<div class="px-5 border">
							<h4>查询</h4>
							<hr class="featurette-divider">

							<div class="px-5 paddingt paddingb">
								<div class="px-5 border">
									<form action="../searchResu.view?rtable=checkin_info"
										method="post">
										<div class="row ">
											<div class="col-4">
												<h4>请选择查询条件：</h4>
											</div>
											<div class="col-8">
												<select name="search_select_cond"
													class="custom-select month">
													<option value="record">入住编号</option>
													<option value="room_id">房间号</option>
													<option value="c_name">住客姓名</option>
													<option value="c_paper">住客证件</option>
												</select>
											</div>
										</div>
										<hr class="featurette-divider">
										<div class="paddingb">
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
												<c:when test="${rcheckin_infos.length!=0 }">
													<table class="table" id="table" data-toggle="table"
														data-pagination="true" data-page-size="5">
														<thead class="thead-dark">
															<tr>
																<th scope="col">记录编号</th>
																<th scope="col">入住房间号</th>
																<th scope="col">入住人员姓名</th>
																<th scope="col">入住人员证件号码</th>
																<th scope="col">入住时间</th>
																<th scope="col">预订入住天数</th>
																<th scope="col">定金</th>
																<th scope="col">状态</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="ritem_checkin_infos"
																items="${rcheckin_infos.list }">
																<tr>
																	<td>${ritem_checkin_infos.record }</td>
																	<td>${ritem_checkin_infos.room_id }</td>
																	<td>${ritem_checkin_infos.c_name }</td>
																	<td>${ritem_checkin_infos.c_paper }</td>
																	<td>${ritem_checkin_infos.ci_time }</td>
																	<td>${ritem_checkin_infos.ci_days }</td>
																	<td>${ritem_checkin_infos.ci_deposit }</td>
																	<td>${ritem_checkin_infos.ci_state }</td>
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
					<div class="tab-pane fade show  " id="manage" role="tabpanel"
						aria-labelledby="manage-tab">
						<div class="px-5 border paddingb ">
							<h4>管理</h4>
							<hr class="featurette-divider">
							<div class="px-5 paddingt paddingb border">
								<h4>确认按时退房和处理中途退房</h4>
								<hr class="featurette-divider">
								<form action="../billcreate.do" method="post">
									<div class="row paddingb">
										<div class="col-4">
											<label>选择功能：</label> <input type="radio" name="function"
												value="confirm" checked>按时退房 <input type="radio"
												name="function" value="quit">中途退房
										</div>
										<div class="col-2">
											<input type="text" name="record" class="form-control"
												placeholder="目标房间编号">
										</div>
										<div class="col-4">
											<select name="customerType" class="custom-select">
												<option value="#">请选择客户类型</option>
												<option value="1">会员</option>
												<option value="2">普通顾客</option>
												<option value="3">境外人员</option>
												<option value="4">港澳台人员</option>
											</select>
										</div>
										<div class="col-2">
											<button class="btn btn-lg btn-outline-primary btn-block"
												type="submit">确认</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show " id="roominfo" role="tabpanel"
						aria-labelledby="roominfo-tab">
						<ul class="nav nav-tabs" id="myTab" role="tablist">
							<li class="nav-item"><a class="nav-link active"
								id="tolroom-tab" data-toggle="tab" href="#tolroom" role="tab"
								aria-controls="tolroom" aria-selected="true">所有记录</a></li>
							<li class="nav-item"><a class="nav-link" id="free-tab"
								data-toggle="tab" href="#free" role="tab" aria-controls="free"
								aria-selected="false">空闲中</a></li>
							<li class="nav-item"><a class="nav-link" id="booking-tab"
								data-toggle="tab" href="#booking" role="tab"
								aria-controls="booking" aria-selected="false">预订中</a></li>
							<li class="nav-item"><a class="nav-link" id="stay-tab"
								data-toggle="tab" href="#stay" role="tab" aria-controls="stay"
								aria-selected="false">入住中</a></li>
						</ul>
						<div class="tab-content" id="myTabContent">

							<div class="tab-pane fade show  " id="tolroom" role="tabpanel"
								aria-labelledby="tolroom-tab">
								<table class="table" id="table" data-toggle="table"
									data-pagination="true" data-page-size="5">
									<thead class="thead-dark">
										<tr>
											<th scope="col">房间号</th>
											<th scope="col">状态</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item_room_infos" items="${room_infos.list }">

											<tr>
												<td>${item_room_infos.room_id }</td>
												<td>${item_room_infos.room_state }</td>
											</tr>

										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade show " id="free" role="tabpanel"
								aria-labelledby="free-tab">
								<table class="table" id="table" data-toggle="table"
									data-pagination="true" data-page-size="5">
									<thead class="thead-dark">
										<tr>
											<th scope="col">房间号</th>
											<th scope="col">状态</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item_room_infos" items="${room_infos.list }">
											<c:if test="${item_room_infos.room_state==0 }">
												<tr>
													<td>${item_room_infos.room_id }</td>
													<td>空闲中</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade show " id="booking" role="tabpanel"
								aria-labelledby="booking-tab">
								<table class="table" id="table" data-toggle="table"
									data-pagination="true" data-page-size="5">
									<thead class="thead-dark">
										<tr>
											<th scope="col">房间号</th>
											<th scope="col">状态</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item_room_infos" items="${room_infos.list }">
											<c:if test="${item_room_infos.room_state==1 }">
												<tr>
													<td>${item_room_infos.room_id }</td>
													<td>预订中</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
							<div class="tab-pane fade show " id="stay" role="tabpanel"
								aria-labelledby="stay-tab">
								<table class="table" id="table" data-toggle="table"
									data-pagination="true" data-page-size="5">
									<thead class="thead-dark">
										<tr>
											<th scope="col">房间号</th>
											<th scope="col">状态</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="item_room_infos" items="${room_infos.list }">
											<c:if test="${item_room_infos.room_state==-1 }">
												<tr>
													<td>${item_room_infos.room_id }</td>
													<td>入住中</td>
												</tr>
											</c:if>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>

					</div>
					
				</div>
			</div>
		</div>
	</div>

</body>
</html>