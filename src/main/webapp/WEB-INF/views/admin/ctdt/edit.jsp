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
							<li class="active"><a href="#">Chương trình đào tạo</a></li>
						</ol>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="card-box">
						<form method="post" action='<c:url value='/ctdt/create' />' id="default-wizard">
							<fieldset title="Chương trình đào tạo" style="margin-bottom: 20px;">
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
								<p id="add-hk-error" class="text-danger" style="display: none">Học phần bị trùng lặp</p>
								<div class="row">
									<div class="col-sm-4">
										<div class="form-group">
											<label for="firstname">Môn học</label>
										</div>
									</div>
									<!-- <div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Mã học phần</label>
										</div>
									</div>
									<div class="col-sm-4">
										<div class="form-group">
											<label for="lastname">Số tín chỉ</label>
										</div>
									</div> -->
								</div>
								
								<div id="div-add-hp">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control" name="hocPhan" onchange="checkDup()">
													<c:forEach items="${hocPhans}" var="hocPhan">															
														<option value="${hocPhan.id}">${hocPhan.vi_name}</option>
													</c:forEach>
												</select>
											</div>
										</div>
									</div>
								</div>

								<div id="hoc-phan" style="display: none;">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control" name="hocPhan"  onchange="checkDup()">
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
							<div class="row">
								<button type="submit" class="btn btn-success stepy-finish pull-right"
								style="margin-top: 15px;">Lưu </button>
							</div>
							
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
							<fieldset title="${hpInHK.hocKi.ten}" style="margin-bottom: 20px;">
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
									<div class="col-sm-2">
										<div class="form-group">
											<label for="lastname">Số tín chỉ</label>
										</div>
									</div>
									<div class="col-sm-2">
										<div class="form-group">
											<button onclick="showUpEdit(${hpInHK.hocKi.id})" type="button" class="btn btn-default pull-right" style="width: auto;">Sửa</button>
										</div>
									</div>
								</div>
								<c:forEach items="${hpInHK.dsHocPhan}" var="hpp">
									<div class="row">
										<div class="col-sm-4">
											<div class="form-group">
												<p>${hpp.vi_name}</p>
											</div>
										</div>
										<div class="col-sm-4">
											<div class="form-group">
												<p>${hpp.ma_hoc_phan}</p>
											</div>
										</div>
										<div class="col-sm-2">
											<div class="form-group">
												<p>${hpp.so_tin_chi}</p>
											</div>
										</div>
										<div class="col-sm-2 edit-hk-${hpInHK.hocKi.id} }" style="display: none;">
											<form action="<c:url value='/ctdt/delHPInHK' />" method="post">
												<input type="hidden" name="ctdtId" value="${ctdt.id}">
												<input type="hidden" name="hocKiId" value="${hpInHK.hocKi.id}">
												<input type="hidden" name="hocPhanId" value="${hpp.id}">
												<div class="form-group">
													<button type="submit" class="btn btn-danger" style="width: auto;">Xóa</button>
												</div>
											</form>
										</div>
									</div>
									
								</c:forEach>
								<div class="row edit-hk-${hpInHK.hocKi.id} }" style="display: none;">
									<form action="<c:url value='/ctdt/addHPToHK' />" method="post">
										<input type="hidden" name="ctdtId" value="${ctdt.id}">
										<input type="hidden" name="hocKiId" value="${hpInHK.hocKi.id}">
										<div class="col-sm-4">
											<div class="form-group">
												<select class="form-control" name="hocPhanId">
													<c:forEach items="${hocPhans}" var="hocPhan">															
														<option value="${hocPhan.id}">${hocPhan.vi_name}</option>
													</c:forEach>
												</select>
											</div>
											
										</div>
										<div class="col-sm-8">
											<button type="submit" class="btn btn-success" style="width: auto;">Thêm học phần</button>
										</div>
									</form>
								</div>
							</fieldset>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>

	<footer class="footer text-right"> 2017 © Adminox. -
		Coderthemes.com </footer>

</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
function checkDup(){
	var arr = [];
	
	$('#div-add-hp option:selected').each(function(index, element){
		arr[index] = element.value;
	});
	sorted_arr = arr.slice().sort();
	
	var i = 0;
	for (i = 0; i < sorted_arr.length - 1; i++) {
	    if (sorted_arr[i + 1] == sorted_arr[i]) {
	        $('#add-hk-error').css({"display": "block"});
	        break;
	    }
	}
	console.log(i);
	if (i+1 == sorted_arr.length){
		$('#add-hk-error').css({"display": "none"});
	}
}

function showUpEdit(hkId) {
	var selectorClassName = "edit-hk-" + hkId;
	var arr = document.getElementsByClassName(selectorClassName);
	
	for(var i=0; i<arr.length; i++){
		if (arr[i].style.display == 'none')
			arr[i].style.display = 'block';
		else
			arr[i].style.display = 'none';
	}
}

</script>
<script>
$(document).ready(function(){
	$('#them-hk-btn').click(function(){
		$('#add-hk-form').css({"display": "block"});
	});
	$('#them-hp-btn').click(function(){
		$('#div-add-hp').append($('#hoc-phan').html());
		checkDup();
	});
	
});

</script>





