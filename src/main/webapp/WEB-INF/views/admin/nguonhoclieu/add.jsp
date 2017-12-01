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
                                    <h4 class="page-title">Thêm Nguồn Học Liệu</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Chương Trình Đào Tạo</a>
                                        </li>
                                        <li>
                                            <a href="#">${ctdtId}</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li>
                                            <a href="#">${hocphanId}</a>
                                        </li>
                                        <li>
                                            <a href="#">Đề Cương</a>
                                        </li>
                                        <li>
                                            <a href="#">Nguồn Học Liệu</a>
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
                        <div class="row">
                            <div class="col-md-12">
                                <div class="card-box">
                                    <form id="default-wizard" method="POST" action='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphanId}/decuong/${decuongId}/nguonhoclieu/add' />'>
                                        <fieldset title="1">
                                            <legend>Thêm Nguồn Học Liệu</legend>
									
                                            	<div class="col-sm-12">
                                                	<label for="hocphan">Tên Học Liệu</label>
                                                	<input type="text" class="form-control" name="tenHocLieu" required>
                                                </div>
                                                <div class="col-sm-12">
                                                	<div class="form-group">
                                                        <label>Loại Học Liệu</label>
                                                        <select class="form-control" name="loaiHocLieuId">
                                                        	<c:forEach items="${loaihoclieu}" var="item">
                                                        		<option value="${item.id}">${item.tenLoai}</option>
                                                        	</c:forEach>
                                                        </select>
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
                    2017 © Admin. - daotao.dut.udn
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

