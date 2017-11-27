<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="content-page">
                <!-- Start content -->
                <div class="content">
                    <div class="container">
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="page-title-box">
                                    <h4 class="page-title">THÊM GIẢNG VIÊN</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Giảng viên</a>
                                        </li>
                                        <li class="active">
                                            THÊM
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- Basic Form Wizard -->
                        <div class="row ">
                            <div class="col-md-12 ">
                                <div class="card-box bootstrap-iso">
                                    <form name="form-giangvien" id="default-wizard" method="post" action='<c:url value='/giangvien/add' />' enctype="multipart/form-data" >
                                        <fieldset title="1">
                                        	<c:if test="${param['msg'] eq 'emailUnique'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  	Nhập Email khác. Email đã tồn tại
												</div>
											</c:if>
											
											<c:if test="${param['msg'] eq 'usernameUnique'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  	Nhập Tài khoản khác. Tài khoản đã tồn tại
												</div>
											</c:if>
											
											<c:if test="${param['msg'] eq '1'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  	Thêm giáo viên thất bại
												</div>
											</c:if>
											
                                            <legend>THÔNG TIN THÊM</legend>
                                            <div class="row m-t-20">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Họ tên</label>
                                                        <input type="text" name="ten" value="${giangvien.ten}" class="form-control" required="required">
                                                        <form:errors path="giangvien.ten" cssStyle="color:red"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Ngày sinh</label>
                                                        <input type="text" name="ngaySinh" value="${giangvien.ngaySinh}" class="form-control" id="datepicker" placeholder="YYYY-MM-DD" required="required">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" name="email" value="${giangvien.email}" class="form-control" id="firstname" required="required">
                                                    	 <form:errors path="giangvien.email" cssStyle="color:red"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="GioiTinh">Giới tính</label>
                                                        <select class="form-control" name="gioiTinh">
                                                        	<option value="1">Nam</option>
                                                        	<option value="0">Nữ</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label>Học Vị</label>
														<select class="form-control" name="idHocVi">
															<c:forEach items="${hocvis}" var="hocvi">
																<option value="${hocvi.id}">${hocvi.hocVi}</option>
															</c:forEach>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Khoa</label>
														<select class="form-control" name="idKhoa" >
															<c:forEach items="${khoas}" var="khoa">															
																<option value="${khoa.id}">${khoa.ten}</option>
															</c:forEach>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label >SĐT</label>
                                                        <input type="text" name="soDienThoai" value="${giangvien.soDienThoai}" class="form-control" required="required">
                                                         <form:errors path="giangvien.soDienThoai" cssStyle="color:red"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label >Tài khoản</label>
                                                        <input type="text" name="username" value="${giangvien.username}" class="form-control"  required="required">
                                                        <form:errors path="giangvien.username" cssStyle="color:red"></form:errors>
                                                    </div>
                                                </div>
                                                <div class="col-md-4">
		                                            <div class="form-group">
		                                                <label>Hình ảnh</label>
		                                                <input type="file" name="picture" class="form-control" placeholder="Chọn ảnh" onchange="viewImg(this)" />
		                                            </div>
	                                        	</div>
		                                        <div class="col-md-4">
		                                            <div class="form-group">
		                                                <label style = 'color:white;background-color:#f25e28; padding: 10px'>Hiển thị</label><br>
		                                                <img id = "avartar-img-show" src="" width="120px" alt="" /> Xóa <input type="checkbox" name="delete_picture" value="1" />
		                                            </div>
		                                        </div>
                                        </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary stepy-finish">Submit</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- End row -->
                    </div> <!-- container -->
                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 © Adminox. - Coderthemes.com
                </footer>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


