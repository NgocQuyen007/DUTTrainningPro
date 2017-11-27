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
                                    <h4 class="page-title">Xem Chi Tiết Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li class="active">
                                            Xem
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
                                        <fieldset title="1">
                                        	<div class="row">
	                                        		<div class="col-sm-9">
	                                        			<h3>Xem Chi Tiết Học Phần</h3>
	                                        		</div>
	                                        		<div class="col-sm-3">
	                                        			<a href="<c:url value=''/>"><button class="btn btn-primary stepy-finish">Xem đề cương học phần</button></a>
	                                        		</div>      			                                     	
                                           	</div>
                                        	                                                                                     
                                            <div class="row m-t-20">
                                                <div class="col-sm-12">
                                                    <div class="col-sm-4">
                                                        <label for="vi_name">Tên Tiếng Việt</label>
                                                        <input disabled="true" type="text" class="form-control" id="vi_name" placeholder="" value="${hocphan.vi_name}"/>
                                                    </div>
													<div class="col-sm-4">
                                                        <label for="vi_name">Tên Tiếng Anh</label>
                                                        <input disabled="true" type="text" class="form-control" id="en_name" placeholder="" value="${hocphan.en_name}"/>
                                                    </div>
													<div class="col-sm-4">
                                                        <label for="en_name">Mã Học Phần</label>
                                                        <input disabled="true" type="text" class="form-control" id="ma_hoc_phan" placeholder="" value="${hocphan.ma_hoc_phan}"/>
                                                    </div>
													<div style="margin-top: 15px" class="col-sm-4">
                                                        <label for="ma_hoc_phan">Loại Học Phần</label>
                                                        <input disabled="true" type="text" class="form-control" id="loai_hoc_phan" placeholder="" value="${hocphan.loai_hoc_phan}"/>
                                                    </div>
													<div style="margin-top: 15px" class="col-sm-4">
                                                        <label for="loai_hoc_phan">Khối Kiến Thức</label>
														<input disabled="true" type="text" class="form-control" id="khoi_kien_thuc_id" value="${requestScope.kkt.ten}" placeholder=""/>
                                                    </div>
													<div style="margin-top: 15px" class="col-sm-4">
                                                        <label for="khoi_kien_thuc_id">Số Tín Chỉ</label>
                                                        <input disabled="true" type="number" step="0.5" class="form-control" id="so_tin_chi" placeholder="" value="${hocphan.so_tin_chi}" />
                                                    </div>
                                                </div>
                                            </div>
                                        </fieldset>
                                        <a href="<c:url value='/hocphan/' />"><button style="margin-top: 11px;margin-left: 10px;" class="btn btn-primary stepy-finish">Cancel</button></a>
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