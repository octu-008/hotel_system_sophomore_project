<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="bills" class="hotel_data.DataList" scope="session"></jsp:useBean>
<jsp:useBean id="rbills" class="hotel_data.DataList" scope="session"></jsp:useBean>
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
				<h2 class="text-right">账单管理</h2>
				<hr class="featurette-divider">
				
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="record-tab" data-toggle="tab" href="#record" role="tab"
						aria-controls="record" aria-selected="true">账单记录</a></li>
					<li class="nav-item"><a class="nav-link" id="search-tab"
						data-toggle="tab" href="#search" role="tab" aria-controls="search"
						aria-selected="false">搜索记录</a></li>
					<li class="nav-item"><a class="nav-link" id="statistic-tab"
						data-toggle="tab" href="#statistic" role="tab" aria-controls="statistic"
						aria-selected="false">账单统计</a></li>
				</ul>
				
				<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active " id="record" role="tabpanel"
						aria-labelledby="record-tab">
				
				<div class="px-5 border paddingt">
				
					<h4>记录</h4>
					<hr class="featurette-divider">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="tol-tab" data-toggle="tab" href="#tol" role="tab"
						aria-controls="tol" aria-selected="true">所有记录</a></li>
					<li class="nav-item"><a class="nav-link" id="member-tab"
						data-toggle="tab" href="#member" role="tab" aria-controls="member"
						aria-selected="false">会员</a></li>
					<li class="nav-item"><a class="nav-link" id="normal-tab"
						data-toggle="tab" href="#normal" role="tab" aria-controls="normal"
						aria-selected="false">顾客</a></li>
					<li class="nav-item"><a class="nav-link" id="abroad-tab"
						data-toggle="tab" href="#abroad" role="tab" aria-controls="abroad"
						aria-selected="false">境外人员</a></li>
					<li class="nav-item"><a class="nav-link" id="HMT-tab"
						data-toggle="tab" href="#HMT" role="tab" aria-controls="HMT"
						aria-selected="false">港澳台人员</a></li>
				</ul>

<div class="tab-content" id="myTabContent">
				<div class="tab-pane fade show active " id="tol" role="tabpanel"
						aria-labelledby="tol-tab">
							<table class="table" data-toggle="table" data-pagination="true"
  data-page-size="5">
								<thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="item_bills" items="${bills.list }">
											<tr>
												<td>${item_bills.record }</td>
												<td>${item_bills.c_name }</td>
												<td>${item_bills.c_paper }</td>
												<td>${item_bills.room_id }</td>
												<td>${item_bills.register_time }</td>
												<td>${item_bills.settle_time }</td>
												<td>${item_bills.c_type }</td>
												<td>${item_bills.cost }</td>
											</tr>
										</c:forEach>
								</tbody>
							</table>
</div>
				<div class="tab-pane fade show" id="member" role="tabpanel"
						aria-labelledby="member-tab">
													<table class="table" data-toggle="table" data-pagination="true"
  data-page-size="5">
								<thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="item_bills" items="${bills.list }">
							<c:if test="${item_bills.c_type==1 }">
											<tr>
												<td>${item_bills.record }</td>
												<td>${item_bills.c_name }</td>
												<td>${item_bills.c_paper }</td>
												<td>${item_bills.room_id }</td>
												<td>${item_bills.register_time }</td>
												<td>${item_bills.settle_time }</td>
												<td>${item_bills.c_type }</td>
												<td>${item_bills.cost }</td>
											</tr>
							</c:if>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade show" id="normal" role="tabpanel"
						aria-labelledby="normal-tab">
						<table class="table" data-toggle="table" data-pagination="true"
  data-page-size="5">
								<thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="item_bills" items="${bills.list }">
							<c:if test="${item_bills.c_type==2 }">
											<tr>
												<td>${item_bills.record }</td>
												<td>${item_bills.c_name }</td>
												<td>${item_bills.c_paper }</td>
												<td>${item_bills.room_id }</td>
												<td>${item_bills.register_time }</td>
												<td>${item_bills.settle_time }</td>
												<td>${item_bills.c_type }</td>
												<td>${item_bills.cost }</td>
											</tr>
							</c:if>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade show" id="abroad" role="tabpanel"
						aria-labelledby="abroad-tab">
						<table class="table" data-toggle="table" data-pagination="true"
  data-page-size="5">
								<thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="item_bills" items="${bills.list }">
							<c:if test="${item_bills.c_type==3 }">
											<tr>
												<td>${item_bills.record }</td>
												<td>${item_bills.c_name }</td>
												<td>${item_bills.c_paper }</td>
												<td>${item_bills.room_id }</td>
												<td>${item_bills.register_time }</td>
												<td>${item_bills.settle_time }</td>
												<td>${item_bills.c_type }</td>
												<td>${item_bills.cost }</td>
											</tr>
							</c:if>
										</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="tab-pane fade show" id="HMT" role="tabpanel"
						aria-labelledby="HMT-tab">
						<table class="table" data-toggle="table" data-pagination="true"
  data-page-size="5">
								<thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
								<tbody>
							<c:forEach var="item_bills" items="${bills.list }">
							<c:if test="${item_bills.c_type==4 }">
											<tr>
												<td>${item_bills.record }</td>
												<td>${item_bills.c_name }</td>
												<td>${item_bills.c_paper }</td>
												<td>${item_bills.room_id }</td>
												<td>${item_bills.register_time }</td>
												<td>${item_bills.settle_time }</td>
												<td>${item_bills.c_type }</td>
												<td>${item_bills.cost }</td>
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
					<form action="../searchResu.view?rtable=bill" method="post">
					<div class="row ">
					<div class="col-4">
					<h4>请选择查询条件：</h4>
					</div>
					<div class="col-8">
					<select  name="search_select_cond" class="custom-select month">
					<option value="c_name">顾客姓名</option>
					<option value="c_paper">顾客证件</option>
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
						<c:when test="${rbills.length!=0 }">
						<table class="table" data-toggle="table" data-pagination="true" 
  data-page-size="5">
	                    <thead class="thead-dark">
									<tr>
										<th scope="col">账单编号</th>
										<th scope="col">顾客姓名</th>
										<th scope="col">顾客证件</th>
										<th scope="col">房间号</th>
										<th scope="col">入住时间</th>
										<th scope="col">离开时间</th>
										<th scope="col">顾客类型</th>
										<th scope="col">花费(元)</th>
									</tr>
								</thead>
						<tbody>
								<c:forEach var="ritem_rbills"
														items="${rbills.list }">
														<tr>	
												<td>${ritem_rbills.record }</td>
												<td>${ritem_rbills.c_name }</td>
												<td>${ritem_rbills.c_paper }</td>
												<td>${ritem_rbills.room_id }</td>
												<td>${ritem_rbills.register_time }</td>
												<td>${ritem_rbills.settle_time }</td>
												<td>${ritem_rbills.c_type }</td>
												<td>${ritem_rbills.cost }</td>
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
				
								<div class="tab-pane fade show " id="statistic" role="tabpanel"
						aria-labelledby="statistic-tab">
				<div class="px-5 border paddingt ">
				    <h4>统计</h4>
					<hr class="featurette-divider">
					<table class="table text-center" data-toggle="table" data-pagination="true" 
  data-page-size="5">
  <thead>
                   <tr>
                   <th scope="col">#</th>
                   <th scope="col">消费金额(元)</th>
                   </tr>
                   </thead>
                   <tbody>
                   <tr>
                   <td scope="row">所有顾客</td>
                   <td>${totalprice_0 }</td>
                   </tr>
                   <tr>
                   <td scope="row">顾客类型1：会员</td>
                   <td>${totalprice_1 }</td>
                   </tr>
                   <tr>
                   <td scope="row">顾客类型2：普通顾客</td>
                   <td>${totalprice_2 }</td>
                   </tr>
                   <tr>
                   <td scope="row">顾客类型3：境外人员</td>
                   <td>${totalprice_3 }</td>
                   </tr>
                   <tr>
                   <td scope="row">顾客类型4：港澳台人员</td>
                   <td>${totalprice_4 }</td>
                   </tr>
                   </tbody>
                   </table>
				</div>
				</div>
				
				</div>
			</div>
		</div>
	</div>

</body>
</html>