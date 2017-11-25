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
                                    <h4 class="page-title">Xem Đề Cương Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li>
                                            <a href="#">${hocphan.viName}</a>
                                        </li>
                                        <li class="active">
                                            <a href="#">Đề Cương</a>
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
                                            <legend>Đề Cương Học Phần <span>${hocphan.viName}</span></legend>
                                            <div class="row m-t-20">
                                            	<div class="form-group">
                                            		<div class="form-group col-sm-6">
                                                        <label for="hocphan">Tên Học Phần</label>
                                                    	<div>${hocphan.viName}</div>
                                                    </div>
                                                    <div class="form-group col-sm-6">
                                                        <label for="hocphan">Subject's Name</label>
                                                    	<div>${hocphan.enName}</div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Giảng Viên Phụ Trách</label>
                                                        <div>${giangvien.ten}</div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                	<div class="form-group">
                                                        <label>Giảng Viên Hỗ Trợ</label>
                                                        <div>${giangvienass.ten}</div>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-12">
                                                	<label for="mo_ta">Mô Tả</label>
                                                	<div>${decuonghocphan.moTa}</div>
                                                </div>
                                                <div class="form-group col-sm-12">
                                                	<label>Mục Tiêu Học Phần</label>
                                                	<c:choose>
                                                		<c:when test="${empty muctieuhp}">
                                                			<div class="form-group">
		                                                		<a href='<c:url value='/hocphan/${hocphan.id}/decuong/${decuonghocphan.id}/muctieu/add' />' class="btn btn-primary">
																	<span>Thêm Mục Tiêu Học Phần</span>
																</a>
		                                                	</div>
                                                		</c:when>
                                                		<c:when test="${not empty muctieuhp}">
                                                		 <table class="table text-center table-bordered" id="muc-tieu-hoc-phan-table">
														    <thead>
														      <tr>
														        <th class="col-md-1 text-center">Mục Tiêu (1)</th>
														        <th class="col-md-6 text-center">Mô tả mục tiêu (2)</th>
														        <th class="col-md-6 text-center">Chuẩn đầu ra của CTĐT (3)</th>
														        <th class="col-md-3 text-center">TĐNL (4)</th>
														      </tr>
														    </thead>
														    <tbody>
														    	<c:forEach items="${muctieuhp}" var="item">
															    	<tr id="standard-row">
																        <td class="muc-tieu">
																        	<span class="form-control">item.ten</span>
																        </td>
																        <td>
																        	<div class="form-control">
																        		${item.moTa}
																        	</div>
																        </td>
																        <td>
																        	
																        </td>
																        <td>
																        	<span>
																        	</span>
																        </td>
																    </tr>
															    </c:forEach>
														    </tbody>
													  	</table>
													  	</c:when>
                                                	</c:choose>
                                                </div>
                                         </div>
                                    </fieldset>

                                </div>
                            </div>
                        </div>
                        <!-- End row -->
                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 Â© Adminox. - Coderthemes.com
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

