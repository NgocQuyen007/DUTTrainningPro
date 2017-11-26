<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="content-page">
	<!-- Start content -->
	<div class="content">
		<div class="container">
			<div class="row">
				<div class="col-xs-12">
					<div class="page-title-box">
						<h4 class="page-title">THÊM CHƯƠNG TRÌNH ĐÀO TẠO</h4>
						<ol class="breadcrumb p-0 m-0">
							<li><a href="#">DUT</a></li>
							<li><a href="#">Chương trình đào tạo</a></li>
							<li class="active">THÊM</li>
						</ol>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card-box">
						<form method="post" action='<c:url value='/ctdt/create' />' id="default-wizard">
							<fieldset title="Học kì 1" style="margin-bottom: 20px;">
								<legend>THÊM CHƯƠNG TRÌNH ĐÀO TẠO</legend>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Tên CTĐT</label>
											<p>${ctdt.ten}</p>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Khoa</label>
											<p>${ctdt.khoa.ten}</p>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Loại</label>
											<p>${ctdt.loai.ten}</p>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Niên khóa</label>
											<p>${ctdt.nienKhoa}</p>
										</div>
									</div>
								</div>
							</fieldset>
							<div class="row">
								<button type="button" id="them-hk-btn" class="btn btn-primary stepy-finish pull-right"
									style="margin-top: 15px;">Thêm học kì</button>
							</div>
						</form>

					</div>
				</div>
			</div>
			<!-- Basic Form Wizard -->
			<div class="row" style="display: none;" id="add-hk-form">
				<div class="col-md-12">
					<div class="card-box">
						<form id="default-wizard" action="<c:url value='/ctdt/addHP' />" method="post">
							<input name="ctdtId" value="${ctdt.id}" type="hidden" />
							<fieldset title="Học kì 1" style="margin-bottom: 20px;">
								<select class="form-control" name="hocKiId" style="width: auto;">
									<c:forEach items="${hocKis}" var="hocKi">															
										<option value="${hocKi.id}">${hocKi.ten}</option>
									</c:forEach>
								</select>

								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="firstname">Môn học</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Mã học phần</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Số tín chỉ</label>
										</div>
									</div>
								</div>
								
								<div id="div-add-hp">
								</div>

								<div id="hoc-phan">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control" name="hocPhan" >
													<c:forEach items="${hocPhans}" var="hocPhan">															
														<option value="${hocPhan.id}">${hocPhan.vi_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									
								</div>

								<div class="row">
									<div class="col-sm-4">
										<button id="them-hp-btn" type="button" style="width: 100%;">Thêm học phần</button>
									</div>
								</div>
										
							</fieldset>
							<button type="submit" class="btn btn-primary stepy-finish"
								style="margin-top: 15px;">Lưu </button>
						</form>

					</div>
				</div>
			</div>
			<!-- End row -->
			<c:forEach items="${ctdt.hocPhanCTDTList}" var="hpCTDT">
				<p>${hpCTDT.hocPhanId}</p>
			</c:forEach>
			<c:forEach items="${ctdt.hocPhanHocKiCTDTs}" var="hpInHK">
				<div class="row">
					<div class="col-md-12">
						<div class="card-box">
							<form id="default-wizard" action="#" method="post">
								<fieldset title="Học kì 1" style="margin-bottom: 20px;">
									<legend>${hpInHK.hocKi.ten}</legend>
				
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<label for="firstname">Môn học</label>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label for="lastname">Mã học phần</label>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<label for="lastname">Số tín chỉ</label>
											</div>
										</div>
									</div>
									<c:forEach items="${hpInHK.dsHocPhan}" var="hpp">
										<div id="div-add-hp">
											<div class="row">
												<div class="col-sm-4">
													<div class="form-group">
														<p>${hpp.vi_name}</p>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label for="lastname">MHP1</label>
													</div>
												</div>
												<div class="col-sm-4">
													<div class="form-group">
														<label for="lastname">1</label>
													</div>
												</div>
											</div>
					
										</div>
									</c:forEach>
				
				
									<div class="row">
										<div class="col-sm-4">
											<button id="add-hp" onclick="addHP()" type="button" style="width: 100%;">Thêm học phần</button>
										</div>
									</div>
				
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</c:forEach>
			<div class="row" style="display: none;" id="add-hk-form">
				<div class="col-md-12">
					<div class="card-box">
						<form id="default-wizard" action="#" method="post">
							<input name="ctdtId" value="${ctdt.id}" type="hidden" />
							<fieldset title="Học kì 1" style="margin-bottom: 20px;">
								<select class="form-control" name="hocKiId" style="width: auto;">
									<c:forEach items="${hocKis}" var="hocKi">															
										<option value="${hocKi.id}">${hocKi.ten}</option>
									</c:forEach>
								</select>

								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="firstname">Môn học</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Mã học phần</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Số tín chỉ</label>
										</div>
									</div>
								</div>
								
								<div id="div-add-hp">
								</div>

								<div id="hoc-phan">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control" name="hocPhan" >
													<c:forEach items="${hocPhans}" var="hocPhan">															
														<option value="${hocPhan.id}">${hocPhan.vi_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
									
								</div>

								<div class="row">
									<div class="col-sm-4">
										<button id="them-hp-btn" type="button" style="width: 100%;">Thêm học phần</button>
									</div>
								</div>
										
							</fieldset>
							<button type="submit" class="btn btn-primary stepy-finish"
								style="margin-top: 15px;">Lưu </button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer text-right"> 2017 © Adminox. -
		Coderthemes.com </footer>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){
	$('#them-hk-btn').click(function(){
		$('#add-hk-form').css({"display": "block"});
	});
	$('#them-hp-btn').click(function(){
		$('#div-add-hp').append($('#hoc-phan').html());
	});
});
</script>



