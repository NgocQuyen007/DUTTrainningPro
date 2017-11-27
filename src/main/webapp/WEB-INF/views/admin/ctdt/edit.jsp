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
						<form method="post" action='<c:url value='/ctdt/update' />' id="edit-ctdt-form">
							<input type="hidden" name="id" value="${ ctdt.id }" />
							<fieldset title="Chương trình đào tạo" style="margin-bottom: 20px;">
								<legend>
									THÊM CHƯƠNG TRÌNH ĐÀO TẠO
									<button onclick="enableEditCTDT()" type="button" class="btn btn-default pull-right" style="width: auto;margin-bottom: 5px;">Sửa</button>
								</legend>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Tên CTĐT</label>
											<input type="text" name="ten" value="${ctdt.ten}" class="form-control edit-ctdt-param" required="required" disabled=disabled>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Khoa</label>
											<select class="form-control edit-ctdt-param" name="khoaId" disabled=disabled>
												<c:forEach items="${khoas}" var="khoa">		
													<c:choose>
													    <c:when test="${khoa.id == ctdt.khoa.id}">
													       <option value="${khoa.id}" selected>${khoa.ten}</option>
													    </c:when>    
													    <c:otherwise>
													       <option value="${khoa.id}">${khoa.ten}</option>
													    </c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Loại</label>
											<select class="form-control edit-ctdt-param" name="loaiId" disabled=disabled>
												<c:forEach items="${loais}" var="loai">															
													<c:choose>
													    <c:when test="${loai.id == ctdt.loai.id}">
													       <option value="${loai.id}" selected>${loai.ten}</option>
													    </c:when>    
													    <c:otherwise>
													       <option value="${loai.id}">${loai.ten}</option>
													    </c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Niên khóa</label>
											<input type="text" name="nienKhoa" value="${ctdt.nienKhoa}" class="form-control edit-ctdt-param" required="required" disabled=disabled>
										</div>
									</div>
								</div>
							</fieldset>
							<div class="row">
								<button id="save-ctdt-btn" type="submit" class="btn btn-success stepy-finish pull-right"
									style="margin-top: 15px;display: none;" >Lưu</button>
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
					
						<c:choose>
						  <c:when test="${hocPhans.size() > 0}">
						    <form id="default-wizard" action="<c:url value='/ctdt/addHP' />" method="post">
								<input name="ctdtId" value="${ctdt.id}" type="hidden" />
								<fieldset title="Thêm học phần" style="margin-bottom: 20px;">
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
						  </c:when>
						  <c:otherwise>
						  	<h2>Thêm học kì</h2>
						    <p class="text-danger">Không còn học phần nào để thêm!</p>
						  </c:otherwise>
						</c:choose>
					
					
						

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
									<div class="col-sm-6">
					 			 		<c:choose>
											<c:when test="${hocPhans.size() > 0}">
												<button type="submit" class="btn btn-success" style="width: auto;">Thêm học phần</button>
											</c:when>
										  	<c:otherwise>
										    	<p class="text-primary">Không còn học phần nào để thêm!</p>
										  	</c:otherwise>
									  	</c:choose>
								  	</div>
								  	</form>
									
									
									<div class="col-sm-2">
										<form action="<c:url value='/ctdt/delHocKi' />" method="post">
											<input type="hidden" name="ctdtId" value="${ctdt.id}">
											<input type="hidden" name="hocKiId" value="${hpInHK.hocKi.id}">
											<div class="col-sm-6">
												<button type="submit" class="btn btn-danger" style="width: auto;">Xóa học kì</button>
											</div>
										</form>
										
									</div>
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

/* function enableDisable(input_tag) {
	for(var i=0; i<input_tag.length; i++){
		console.log(input_tag[i].is('[disabled=disabled]'));
		
		if (input_tag[i].is('[disabled=disabled]')){
			input_tag[i].removeAttribute("disabled");
		} else {
			input_tag[i].setAttribute("disabled", true);
		}
	}
} */

function enableEditCTDT() {
	console.log($('.edit-ctdt-param').is('[disabled=true]'));
	if ($('.edit-ctdt-param').is(':disabled')){
		$('.edit-ctdt-param').prop("disabled", false);
		$('#save-ctdt-btn').css({"display": "block"});
		$('#them-hk-btn').css({"display": "none"});
		
	} else {
		$('.edit-ctdt-param').prop("disabled", true);
		$('#save-ctdt-btn').css({"display": "none"});
		$('#them-hk-btn').css({"display": "block"});
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





