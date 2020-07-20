<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="admin" class="hotel_data.Admin" scope="session"></jsp:useBean>
<jsp:useBean id="book_infos" class="hotel_data.DataList" scope="session"></jsp:useBean>
<jsp:useBean id="rbook_infos" class="hotel_data.DataList"
	scope="session"></jsp:useBean>
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
				<h2 class="text-right">预订管理</h2>
				<hr class="featurette-divider">
				<ul class="nav nav-tabs" id="myTab" role="tablist">
					<li class="nav-item"><a class="nav-link active"
						id="record-tab" data-toggle="tab" href="#record" role="tab"
						aria-controls="record" aria-selected="true">预订记录</a></li>
					<li class="nav-item"><a class="nav-link" id="search-tab"
						data-toggle="tab" href="#search" role="tab" aria-controls="search"
						aria-selected="false">搜索记录</a></li>
					<li class="nav-item"><a class="nav-link" id="manage-tab"
						data-toggle="tab" href="#manage" role="tab" aria-controls="manage"
						aria-selected="false">记录管理</a></li>
				    <li class="nav-item"><a class="nav-link" id="bookRoom-tab"
						data-toggle="tab" href="#bookRoom" role="tab" aria-controls="bookRoom"
						aria-selected="false">预订房间</a></li>
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
								<li class="nav-item"><a class="nav-link" id="booking-tab"
									data-toggle="tab" href="#booking" role="tab"
									aria-controls="booking" aria-selected="false">预定中</a></li>
								<li class="nav-item"><a class="nav-link" id="stayIn-tab"
									data-toggle="tab" href="#stayIn" role="tab"
									aria-controls="stayIn" aria-selected="false">确认入住</a></li>
								<li class="nav-item"><a class="nav-link" id="overdue-tab"
									data-toggle="tab" href="#overdue" role="tab"
									aria-controls="overdue" aria-selected="false">过期/取消</a></li>
								<li class="nav-item"><a class="nav-link" id="cancel-tab"
									data-toggle="tab" href="#cancel" role="tab"
									aria-controls="cancel" aria-selected="false">预订取消</a></li>
							</ul>
							<div class="tab-content" id="TabContent">

								<div class="tab-pane fade show active" id="tol" role="tabpanel"
									aria-labelledby="tol-tab">

									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">预订编号</th>
												<th scope="col">预订房间号</th>
												<th scope="col">预订人员</th>
												<th scope="col">人员证件或联系方式</th>
												<th scope="col">预订入住时间</th>
												<th scope="col">预订退房时间</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_book_infos" items="${book_infos.list }">
												<tr>
													<td>${item_book_infos.record_num }</td>
													<td>${item_book_infos.room_id }</td>
													<td>${item_book_infos.c_name }</td>
													<td>${item_book_infos.c_paper }</td>
													<td>${item_book_infos.book_in_time }</td>
													<td>${item_book_infos.book_quit_time }</td>
													<td>${item_book_infos.book_state }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>


								</div>
								<div class="tab-pane fade " id="booking" role="tabpanel"
									aria-labelledby="booking-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">预订编号</th>
												<th scope="col">预订房间号</th>
												<th scope="col">预订人员</th>
												<th scope="col">人员证件或联系方式</th>
												<th scope="col">预订入住时间</th>
												<th scope="col">预订退房时间</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_book_infos" items="${book_infos.list }">
												<c:if test="${item_book_infos.book_state eq '预订中' }">
													<tr>
														<td>${item_book_infos.record_num }</td>
														<td>${item_book_infos.room_id }</td>
														<td>${item_book_infos.c_name }</td>
														<td>${item_book_infos.c_paper }</td>
														<td>${item_book_infos.book_in_time }</td>
														<td>${item_book_infos.book_quit_time }</td>
														<td>${item_book_infos.book_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade  " id="stayIn" role="tabpanel"
									aria-labelledby="stayIn-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">预订编号</th>
												<th scope="col">预订房间号</th>
												<th scope="col">预订人员</th>
												<th scope="col">人员证件或联系方式</th>
												<th scope="col">预订入住时间</th>
												<th scope="col">预订退房时间</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_book_infos" items="${book_infos.list }">
												<c:if test="${item_book_infos.book_state eq '确认入住' }">
													<tr>
														<td>${item_book_infos.record_num }</td>
														<td>${item_book_infos.room_id }</td>
														<td>${item_book_infos.c_name }</td>
														<td>${item_book_infos.c_paper }</td>
														<td>${item_book_infos.book_in_time }</td>
														<td>${item_book_infos.book_quit_time }</td>
														<td>${item_book_infos.book_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade   " id="overdue" role="tabpanel"
									aria-labelledby="overdue-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">预订编号</th>
												<th scope="col">预订房间号</th>
												<th scope="col">预订人员</th>
												<th scope="col">人员证件或联系方式</th>
												<th scope="col">预订入住时间</th>
												<th scope="col">预订退房时间</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_book_infos" items="${book_infos.list }">
												<c:if test="${item_book_infos.book_state eq '过期/取消' }">
													<tr>
														<td>${item_book_infos.record_num }</td>
														<td>${item_book_infos.room_id }</td>
														<td>${item_book_infos.c_name }</td>
														<td>${item_book_infos.c_paper }</td>
														<td>${item_book_infos.book_in_time }</td>
														<td>${item_book_infos.book_quit_time }</td>
														<td>${item_book_infos.book_state }</td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade   " id="cancel" role="tabpanel"
									aria-labelledby="cancel-tab">
									<table class="table" id="table" data-toggle="table"
										data-pagination="true" data-page-size="5">
										<thead class="thead-dark">
											<tr>
												<th scope="col">预订编号</th>
												<th scope="col">预订房间号</th>
												<th scope="col">预订人员</th>
												<th scope="col">人员证件或联系方式</th>
												<th scope="col">预订入住时间</th>
												<th scope="col">预订退房时间</th>
												<th scope="col">状态</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="item_book_infos" items="${book_infos.list }">
												<c:if test="${item_book_infos.book_state eq '预订取消' }">
													<tr>
														<td>${item_book_infos.record_num }</td>
														<td>${item_book_infos.room_id }</td>
														<td>${item_book_infos.c_name }</td>
														<td>${item_book_infos.c_paper }</td>
														<td>${item_book_infos.book_in_time }</td>
														<td>${item_book_infos.book_quit_time }</td>
														<td>${item_book_infos.book_state }</td>
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
						<div class="px-5 border paddingt">
							<h4>查询</h4>
							<hr class="featurette-divider">
							<div class="px-5 paddingt paddingb">
								<div class="px-5 border">
									<form action="../searchResu.view?rtable=book_info"
										method="post">
										<div class="row ">
											<div class="col-4">
												<h4>请选择查询条件：</h4>
											</div>
											<div class="col-8">
												<select name="search_select_cond"
													class="custom-select month">
													<option value="record_num">预订编号</option>
													<option value="room_id">预订房间号</option>
													<option value="c_name">预订人员</option>
													<option value="c_paper">人员证件</option>
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
												<c:when test="${rbook_infos.length!=0 }">
													<table class="table" id="table" data-toggle="table"
														data-pagination="true" data-page-size="5">
														<thead class="thead-dark">
															<tr>
																<th scope="col">预订编号</th>
																<th scope="col">预订房间号</th>
																<th scope="col">预订人姓名</th>
																<th scope="col">预订人证件</th>
																<th scope="col">预订入住时间</th>
																<th scope="col">预订退房时间</th>
																<th scope="col">状态</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach var="ritem_book_infos"
																items="${rbook_infos.list }">
																<tr>
																	<td>${ritem_book_infos.record_num }</td>
																	<td>${ritem_book_infos.room_id }</td>
																	<td>${ritem_book_infos.c_name }</td>
																	<td>${ritem_book_infos.c_paper }</td>
																	<td>${ritem_book_infos.book_in_time }</td>
																	<td>${ritem_book_infos.book_quit_time }</td>
																	<td>${ritem_book_infos.book_state }</td>
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
						<div class="px-5 border paddingt paddingb">
							<h4>管理</h4>
							<hr class="featurette-divider">
							<div class="px-5 paddingt paddingb border">
								<h4>确认入住和处理预订过期</h4>
								<hr class="featurette-divider">
								<form action="../book_info.change" method="post">
									<div class="row paddingb">
										<div class="col-4">
											<label>选择功能：</label> <input type="radio" name="function"
												value="confirm" checked>确认入住 <input type="radio"
												name="function" value="overdue">处理预订过期
										</div>
										<div class="col-4">
											<input type="text" name="record_num" class="form-control"
												placeholder="请正确填写目标预订编号">
										</div>
										<div class="col-4">
											<button class="btn btn-lg btn-outline-primary btn-block"
												type="submit">确认</button>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
					<div class="tab-pane fade show  " id="bookRoom" role="tabpanel"
						aria-labelledby="bookRoom-tab">
						<div class="px-5 border paddingt paddingb">
						<h4 >客房预订</h4>
						<hr class="featurette-divider">
						<form action="../confirmBook.front" method="post">
						<div class="px-5 border paddingt">
						<div class="row paddingt">
						<div class="col-9"><h4 >输入预订联系人信息</h4></div>
						</div>
						 <hr class="featurette-divider">
						 <div class="row paddingb">
						 <div class="col">
						 <input type="text" name="mainName" class="form-control" placeholder="联系人姓名" required autofocus>
						 </div>
						 <div class="col">
						 <input type="text" name="mainPapper" class="form-control" placeholder="联系人证件号码" required autofocus>
						 </div>
						 </div>
						 <div class="row paddingb">
						 <div class="col-2">
						     入住日期：
						     </div>
   <div class="col-3">
  <select name="i_year" class="custom-select">
  <option value="2019">2019</option>
  </select>
  </div>
  <div class="col-3">
  <select name="i_month" class="custom-select month" id="month">
  <option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
  </select>
  </div>
<div class="col-3">
  <select name="i_day" class="custom-select" id="day">
  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
  </select>
  </div>
						 </div>
						 	<div class="row paddingb">
						 <div class="col-2">
						     退房日期：
						     </div>
   <div class="col-3">
  <select name="q_year" class="custom-select">
  <option value="2019">2019</option>
  </select>
  </div>
  <div class="col-3">
  <select name="q_month" class="custom-select month" id="month">
  <option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option>
  </select>
  </div>
<div class="col-3">
  <select name="q_day" class="custom-select" id="day">
  <option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option> <option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option><option value="31">31</option>
  </select>
  </div>
						 </div>
						 <div class="row paddingb">
						 <input type="text" name="roomId" class="form-control" placeholder="房间号" required autofocus>
						 </div>
						</div>
						 <hr class="featurette-divider">
<div class="px-5 border paddingt paddingb">
						<h4>同行入住者信息</h4>
						<hr class="featurette-divider">
						<div class="row">
						<div class="col-6"> 
						<input type="text" name="aibo_name_1" class="form-control" placeholder="同行入住人1姓名">
						<hr class="featurette-divider">
						<input type="text" name="aibo_paper_1" class="form-control" placeholder="同行入住人1联系方式或身份证号码">
						</div>
						<div class="col-6"> 
						<input type="text" name="aibo_name_2" class="form-control" placeholder="同行入住人2姓名">
						<hr class="featurette-divider">
						<input type="text" name="aibo_paper_2" class="form-control" placeholder="同行入住人2联系方式或身份证号码">
						</div>
						</div>
						<hr class="featurette-divider">
                       <p>*若没有同行者，可以不填该项信息</p> 
					    </div>
					    <div class="text-center paddingt">
					    <button class="btn btn-lg btn-outline-primary" type="submit"> 确认预订</button>
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