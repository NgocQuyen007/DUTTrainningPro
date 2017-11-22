<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                    <h4 class="page-title">Thêm Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li class="active">
                                            Thêm
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->

                        <!-- Basic Form Wizard -->
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    <form:form id="default-wizard" action="add" method="post" modelAttribute="hocphan">
                                        <fieldset title="1">
                                        	<c:if test="${param['msg'] eq '1'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  Thêm học phần thất bại
												</div>
											</c:if>
                                            <legend>Thêm Học Phần</legend>                                           
                                            <div class="row m-t-20">
                                                <div class="col-sm-6">
                                                	<form:input type="hidden" path="id"></form:input>
                                                    <div class="form-group">
                                                        <label for="vi_name">Tên Tiếng Việt</label>
                                                        <form:input type="text" class="form-control" id="vi_name" path="vi_name" placeholder=""/>
                                                    </div>
													<div class="form-group">
                                                        <label for="vi_name">Tên Tiếng Anh</label>
                                                        <form:input type="text" class="form-control" id="en_name" path="en_name"  placeholder=""/>
                                                    </div>
													<div class="form-group">
                                                        <label for="en_name">Mã Học Phần</label>
                                                        <form:input type="text" class="form-control" id="ma_hoc_phan" path="ma_hoc_phan" placeholder=""/>
                                                    </div>
													<div class="form-group">
                                                        <label for="ma_hoc_phan">Loại Học Phần</label>
                                                        <form:input type="text" class="form-control" id="loai_hoc_phan" path="loai_hoc_phan" placeholder=""/>
                                                    </div>
													<div class="form-group">
                                                        <label for="loai_hoc_phan">Khối Kiến Thức</label>
                                                        <form:select class="form-control select2" id="khoi_kien_thuc_id" path="khoi_kien_thuc_id">
															<c:forEach items="${requestScope.listkkt}" var="kkt">
																<form:option value="${kkt.id }">${kkt.ten}</form:option>
															</c:forEach>
														</form:select>
                                                    </div>
													<div class="form-group">
                                                        <label for="khoi_kien_thuc_id">Số Tín Chỉ</label>
                                                        <form:input type="text" class="form-control" id="so_tin_chi" path="so_tin_chi" placeholder="" value="" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary stepy-finish">Submit</button>
                                    </form:form>

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

