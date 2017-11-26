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

			<!-- Basic Form Wizard -->
			<div class="row">
				<div class="col-md-12">
					<div class="card-box">
						<form method="post" action='<c:url value='/ctdt/create' />' id="default-wizard">
							<fieldset title="Học kì 1" style="margin-bottom: 20px;">
								<legend>THÊM CHƯƠNG TRÌNH ĐÀO TẠO</legend>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Khoa</label>
											<select class="form-control" name="khoaId" >
												<c:forEach items="${khoas}" var="khoa">															
													<option value="${khoa.id}">${khoa.ten}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Tên CTĐT</label>
											<input type="text" name="ten" class="form-control" required="required">
										</div>
									</div>
								</div>
								
								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Loại</label>
											<select class="form-control" name="loaiId" >
												<c:forEach items="${loais}" var="loai">															
													<option value="${loai.id}">${loai.ten}</option>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="col-sm-6">
										<div class="form-group">
											<label for="firstname">Niên khóa</label>
											<input type="text" name="nienKhoa" class="form-control" required="required">
										</div>
									</div>
								</div>
							</fieldset>
							<button type="submit" class="btn btn-primary stepy-finish"
								style="margin-top: 15px;">Lưu</button>
						</form>

					</div>
				</div>
			</div>
			<!-- End row -->
		</div>
	</div>

	<footer class="footer text-right"> 2017 © Adminox. -
		Coderthemes.com </footer>

</div>



