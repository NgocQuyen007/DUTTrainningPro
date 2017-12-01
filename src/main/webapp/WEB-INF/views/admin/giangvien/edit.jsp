<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                                    <h4 class="page-title">SỬA GIẢNG VIÊN</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Giảng viên</a>
                                        </li>
                                        <li class="active">
                                            SỬA
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- Basic Form Wizard -->
                        <div class="row">
                            <div class="col-md-12 ">
                                <div class="card-box bootstrap-iso">
                                    <form id="default-wizard" method="post" action='<c:url value='/giangvien/edit/${giangvien.id}' />' enctype="multipart/form-data" >
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
											
											<c:if test="${param['msg'] eq '2'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  Sửa giáo viên thất bại
												</div>
											</c:if>
											
                                            <legend>THÔNG TIN GIẢNG VIÊN</legend>
                                            <div class="row m-t-20">
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label >Tài khoản</label>
                                                        <input type="text" name="username" value="${giangvien.username}" readonly="readonly" class="form-control"  required="required">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">      
                                                    <div class="form-group">
                                                        <label>Họ tên</label>
                                                        <input type="text" name="ten" value="${giangvien.ten}" class="form-control" required="required">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Ngày sinh</label>
                                                        <input type="text" name="ngaySinh" value="${giangvien.ngaySinh}" class="form-control" id="datepicker" placeholder="YYYY/MM/DD" required="required">
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Email</label>
                                                        <input type="text" name="email" value="${giangvien.email}" class="form-control" id="firstname" required="required">
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label for="GioiTinh">Giới tính</label>
                                                        <select class="form-control" name="gioiTinh">
                                                        	<c:choose>
                                                        		<c:when test="${giangvien.gioiTinh == true}">
                                                        			<option selected="selected" value="1">Nam</option>
                                                        			<option value="0">Nữ</option>
                                                        		</c:when>
                                                        		<c:otherwise>
                                                        			<option value="1">Nam</option>
                                                        			<option selected="selected"  value="0">Nữ</option>
                                                        		</c:otherwise>
                                                        	</c:choose>
                                                        	
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-2">
                                                    <div class="form-group">
                                                        <label>Học Vị</label>
														<select class="form-control" name="idHocVi">
															<c:forEach items="${hocvis}" var="hocvi">
															<c:out value="${hocvi.id}"></c:out>
																<c:choose>
																	<c:when test="${giangvien.hocVi.id == hocvi.id}">
																		<option selected="selected" value="${hocvi.id}">${hocvi.hocVi}</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${hocvi.id}">${hocvi.hocVi}</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label>Khoa</label>
														<select class="form-control" name="idKhoa" >
															<c:forEach items="${khoas}" var="khoa">			
																<c:choose>
																	<c:when test="${khoa.id == giangvien.khoa.id}">												
																		<option selected="selected" value="${khoa.id}">${khoa.ten}</option>
																	</c:when>
																	<c:otherwise>
																		<option value="${khoa.id}">${khoa.ten}</option>
																	</c:otherwise>
																</c:choose>
															</c:forEach>
														</select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-4">
                                                    <div class="form-group">
                                                        <label >SĐT</label>
                                                        <input type="text" name="soDienThoai" value="${giangvien.soDienThoai}" class="form-control" required="required">
                                                    </div>
                                                </div>
                                                
                                                <div class="col-sm-4">
		                                            <div class="form-group">
		                                                <label>Hình ảnh</label>
		                                                <input type="file" name="picture" class="form-control" placeholder="Chọn ảnh" onchange="viewImg(this)" />
		                                            </div>
	                                        	</div>
		                                        <div class="col-sm-4">
		                                        	<c:if test="${giangvien.avatar eq ''}">
		                                        		<div class="form-group">
			                                                <label >Hiển thị</label><br>
			                                                <img id = "avartar-img-show" src="<c:url value='/resources/admin/bootstrap/images/users/avatar-2.jpg' />" width="120px" alt="" /> Xóa <input type="checkbox" name="delete_picture" value="1" />
			                                            </div>
		                                        	</c:if>
		                                        	
		                                        	<c:if test="${giangvien.avatar ne ''}">
		                                        		<div class="form-group">
			                                                <label >Hiển thị</label><br>
			                                                <img id = "avartar-img-show" src="${pageContext.request.contextPath}/files/${giangvien.avatar}" width="120px" height="92px" alt="" /> Xóa <input type="checkbox" name="delete_picture" value="1" />
			                                            </div>
		                                        	</c:if>
		                                        </div>
                                        </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary stepy-finish">Lưu thông tin cá nhân</button>
                                    </form>
                                </div>
                            </div>
                            
                            <!-- XỬ LÝ TÀI KHOẢN WEBSITE -->
                            <div class="col-md-12 ">
                                <div class="card-box bootstrap-iso">
                                    <form id="default-wizard" method="post" action='<c:url value='/giangvien/cpass/${giangvien.id}' />'>
                                        <fieldset title="1">
											<c:if test="${param['msg'] eq 'fpass'}">
												<div class="pass-fail">
													  Mật khẩu cũ không đúng !
												</div>
											</c:if>
											<c:if test="${param['msg'] eq 'fcpass'}">
												<div class="pass-fail">
													 Xác thực mật khẩu mới không đúng !
												</div>
											</c:if>
											<c:if test="${param['msg'] eq 'pass'}">
												<div class="pass-success">
													  Đổi mật khẩu thành công !
												</div>
											</c:if>
                                            <legend>TÀI KHOẢN WEBSITE</legend>
                                            	<div class="row m-t-20">
	                                                <div class="col-sm-4">
	                                                    <div class="form-group">
	                                                        <label >Mật khẩu cũ</label>
	                                                        <input type="password" name="old_password"class="form-control" required="required">
	                                                    </div>
	                                                </div>
	                                                <div class="col-sm-4">
	                                                    <div class="form-group">
	                                                        <label >Mật khẩu mới</label>
	                                                        <input type="password" name="password"class="form-control" required="required">
	                                                    </div>
	                                                </div>
	                                                 <div class="col-sm-4">
	                                                    <div class="form-group">
	                                                        <label>Xác nhận mật khẩu mới</label>
	                                                        <input type="password" name="repassword" class="form-control" required="required">
	                                                    </div>
	                                                </div>
                                                </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary stepy-finish">Lưu mật khẩu</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <!-- End row -->
                    </div> <!-- container -->
                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 © Admin. - daotao.dut.udn
                </footer>

            </div>
            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->


