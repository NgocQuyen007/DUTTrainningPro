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
                                    <h4 class="page-title">Thêm Mục Tiêu Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Chương Trình Đào Tạo</a>
                                        </li>
                                        <li>
                                            <a href="#">2</a>
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
                                    <form id="default-wizard" method="POST" action='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/${decuongId}/muctieu/add' />'>
                                        <fieldset title="1">
                                            <legend>Thêm Mục Tiêu Học Phần</legend>
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
                                            </div>
                                            <table class="table text-center table-bordered" id="muc-tieu-hoc-phan-table">
											    <thead>
											      <tr>
											        <th class="col-md-1 text-center">Mục Tiêu (1)</th>
											        <th class="col-md-4 text-center">Mô tả mục tiêu (2)</th>
											        <th class="col-md-4 text-center">Chuẩn đầu ra của CTĐT (3)</th>
											        <th class="col-md-1 text-center">TĐNL (4)</th>
											        <th class="col-md-1 text-center">Action</th>
											      </tr>
											    </thead>
											    <tbody>
											    	<c:choose>
		                                            	<c:when test="${not empty muctieuhp}">
		                                            		<c:forEach items="${muctieuhp}" var="item" varStatus="loop">
														    	<tr id="old-row" disabled>
															        <td class="muc-tieu">
															        	<span class="form-control" disabled>${item.ten}</span>
															        </td>
															        <td>
															        	<span class="form-control" disabled>
															        		${item.moTa}
															        	</span>
															        </td>
															        <td>
															        	<span class="form-control" disabled>
															        		${chuanDauRa.get(loop.count-1).chuanDauRa}
															        	</span>
															        </td>
															        <td>
															        	<span class="form-control" disabled>
															        		${item.trinhDoNangLuc}
															        	</span>
															        </td>
															        <td>
															        </td>
															    </tr>
														    </c:forEach>
		                                            	</c:when>
		                                            </c:choose>
											      <tr id="standard-row">
											        <td class="muc-tieu">
											        	<input type="text" id="muc-tieu" name="ten" class="form-control" value="G1"/>
											        </td>
											        <td>
											        	<textarea class="form-control" rows="2" name="moTa" id="mo_ta" required></textarea>
											        </td>
											        <td>
											        	<c:forEach items="${cdrCTDT}" var="item">
                                                        	<label class="checkbox-inline">
														      <input type="checkbox" name="chuanDauRa0" id="cdr" value="${item.id}">
														      <a href="#" data-toggle="tooltip" title="${item.moTa}">${item.tenCDR}</a>
														    </label>
                                                     	</c:forEach>
											        </td>
											        <td>
											        	<select class="form-control" name="trinhDoNangLuc" required style="width: auto;">
											        		<option value="(1)">(1)</option>
											        		<option value="(2)">(2)</option>
											        		<option value="(3)">(3)</option>
											        		<option value="(4)">(4)</option>
											        		<option value="(5)">(5)</option>
											        	</select>
											        </td>
											        <td>
											        	<button type="button" id="delete-row" class="btn-xs btn-danger hidden">
											        		<span class="fa fa-remove"></span>
											        	</button>
											        </td>
											      </tr>
											    </tbody>
										  	</table>
										  	<button type="button" id="add-row" class="btn-xs btn-warning float-right">Thêm Mục Tiêu Mới</button>
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

