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
                                    <div class="table-responsive">
                                        <table class="table table-hover m-0 mails table-actions-bar table-striped">
                                            <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Tên</th>
                                                <th>Khoa</th>
                                                <th>Loại</th>
                                                <th>Niên khóa</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${ctdts}" var="item">
	                                            <tr>
	                                            	<td>
	                                            		<i class="text-primary"></i> ${item.id}
	                                            	</td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.ten}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.khoa.ten}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.loai.ten}
	                                                </td>
	                                                <td>
	                                                    <i class="text-primary"></i> ${item.nienKhoa}
	                                                </td>
	                                                <td>
	                                                    <a href='<c:url value='/ctdt/${item.id}/edit' />' class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
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
                    2017 © Adminox. - Coderthemes.com
                </footer>

            </div>