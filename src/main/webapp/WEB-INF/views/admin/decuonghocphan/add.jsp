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
                                    <h4 class="page-title">Thêm Đề Cương Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
                                        </li>
                                        <li>
                                            <a href="#">Đề Cương Học Phần</a>
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
                                    <form id="default-wizard" method="POST" action='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/add' />'>
                                        <fieldset title="1">
                                            <legend>Thêm Đề Cương Học Phần</legend>
									
                                            <div class="row m-t-20">
                                            	<div class="form-group">
                                            		<div class="form-group col-sm-6">
                                                        <label for="hocphan">Tên Học Phần</label>
                                                    	<input type="text" class="form-control" id="hocphan" placeholder="${hocphan.vi_name}" disabled>
                                                    </div>
                                                    <div class="form-group col-sm-6">
                                                        <label for="hocphan">Subject's Name</label>
                                                    	<input type="text" class="form-control" id="hocphan" placeholder="${hocphan.en_name}" disabled>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label>Giảng Viên Phụ Trách</label>
                                                        <select class="form-control" name="giangVienId">
                                                        	<c:forEach items="${listGV}" var="item">
                                                        		<option value="${item.id}">${item.ten}</option>
                                                        	</c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                	<div class="form-group">
                                                        <label>Giảng Viên Hỗ Trợ</label>
                                                        <select class="form-control" name="giangVienAssId">
                                                        	<c:forEach items="${listGV}" var="item">
                                                        		<option value="${item.id}">${item.ten}</option>
                                                        	</c:forEach>
                                                        </select>
                                                    </div>
                                                </div>
                                                <div class="form-group col-sm-12">
                                                	<label for="mo_ta">Mô Tả</label>
                                                	<textarea class="form-control" rows="5" name="moTa" id="mo_ta" required></textarea>
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

