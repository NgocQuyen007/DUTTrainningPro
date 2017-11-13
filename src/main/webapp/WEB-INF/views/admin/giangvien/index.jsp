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
                                    <h4 class="m-t-0 header-title"><b>Recent Candidates</b></h4>
									<div>
										<a href='<c:url value='giangvien/add' />' class="btn btn-primary">
											<span>Thêm giảng viên</span>
										</a>
									</div>	
                                    <div class="table-responsive">
                                        <table class="table table-hover m-0 mails table-actions-bar">

                                            <thead>
                                            <tr>
                                                <th>
                                                    <div class="btn-group dropdown">
                                                        <button type="button" class="btn btn-default btn-xs dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"><i class="caret"></i></button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li><a href="#">Action</a></li>
                                                            <li><a href="#">Another action</a></li>
                                                            <li><a href="#">Something else here</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#">Separated link</a></li>
                                                        </ul>
                                                    </div>
                                                </th>
                                                <th>ID</th>
                                                <th>Name</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${list}" var="item">
	                                            <tr>
	                                                <td>
														<img src="<c:url value='/resources/admin/boostrap/images/users/avatar-2.jpg' />" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
	                                                </td>
	                                                <td>
	                                                    <h5 class="m-b-0 m-t-0">${item.id}</h5>
	                                                </td>
	                                                <td>
	                                                    <i class="mdi mdi-map-marker text-primary"></i> ${item.ten}
	                                                </td>
	                                                <td>
	                                                    <a href='<c:url value='/giangvien/edit/${item.id}' />' class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
	                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
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