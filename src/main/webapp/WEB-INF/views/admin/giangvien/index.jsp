<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                                    <h4 class="page-title">Giảng viên</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Giảng viên</a>
                                        </li>
                                        <li class="active">
                                            Danh sách giảng viên
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->
						
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-box">
                                		
                                		<c:if test="${param['msg'] eq 'add'}">
												<div class="alert alert-danger action-success" role="alert">
													  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
													  <span class="sr-only">Error:</span>
													  THÊM THÀNH CÔNG
													</div>
										</c:if>
										<c:if test="${param['msg'] eq 'edit'}">
											<div class="alert alert-danger action-success" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  SỬA THÀNH CÔNG
												</div>
										</c:if>
										<c:if test="${param['msg'] eq 'del'}">
											<div class="alert alert-danger action-success" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  XÓA THÀNH CÔNG
												</div>
										</c:if>
                                
										<div class="body-header-left" >
											<a href='<c:url value='/giangvien/add' />' class="btn btn-primary">
												<span>Thêm giảng viên</span>
											</a>
											
										</div>
										
										<div class="col-md-4 body-header-right">
                                                   <div class="form-group">
													<select class="form-control soption" id="idKhoa" onChange="SearchProcessing()">
														<c:forEach items="${khoas}" var="khoa">
															<option class="soption" value="${khoa.id}">${khoa.ten}</option>
														</c:forEach>
														<option value="" class="sdisable" disabled selected>=== Tìm kiếm theo KHOA ===</option>
													</select>
                                                   </div>
										</div>
										
										<div style="clear: both;"></div>
										
                                    <div class="table-responsive">
                                        <table class="table table-hover m-0 mails table-actions-bar table-striped">
                                            <thead>
                                            <tr>
                                                <th>Hình ảnh</th>
                                                <th>Họ tên</th>
                                                <th>Ngày sinh</th>
                                                <th>Giới tính</th>
                                                <th>Email</th>
                                                <th>SĐT</th>
                                                <th>Cấp bậc</th>
                                                <th>Khoa</th>
                                            </tr>
                                            </thead>
                                            <tbody id='TimKiemKhoa'>
                                            <c:forEach items="${giangviens}" var="item">
	                                            <tr>
	                                            	<c:if test="${item.avatar eq ''}">
		                                                <td>
															<img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-2.jpg' />" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
		                                                </td>
	                                                </c:if>
	                                                <c:if test="${item.avatar ne ''}">
		                                                <td>
															<img src="${pageContext.request.contextPath}/files/${item.avatar}"  alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
		                                                </td>
	                                                </c:if>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.ten}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.ngaySinh}
	                                                </td>
	                                                <td>
	                                                    <c:choose>
	                                                    	<c:when test="${item.gioiTinh==true}">
	                                                    		Nam
	                                                    	</c:when>
	                                                    	<c:otherwise>
	                                                    		Nữ
	                                                    	</c:otherwise>
	                                                    </c:choose> 
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.email}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.soDienThoai}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.hocVi.hocVi}
	                                                </td>
	                                                <td>
	                                                    <i class="mdi mdi-map-marker text-primary"></i> ${item.khoa.ten}
	                                                </td>
	                                                <td>
	                                                    <a href='<c:url value='/giangvien/edit/${item.id}' />' class="btn-xs btn-warning"><i class="mdi mdi-pencil"></i></a>
	                                                    <a href='<c:url value='/giangvien/del/${item.id}' />' class="btn-xs btn-danger" onclick="return confirm('Are you sure to delete this item?');" class="table-action-btn"><i class="mdi mdi-close"></i></a>
	                                                </td>
	                                            </tr>
											</c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <!-- end col -->                           
                        </div>
                        <!--- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 © Admin. - daotao.dut.udn
                </footer>

            </div>