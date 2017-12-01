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
                                    <h4 class="page-title">Thêm Chuẩn Đầu Ra Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li>
                                            <a href="#">${hocphan.vi_name}</a>
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
                                    <form id="default-wizard" method="POST" action='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/${decuongId}/chuandaurahp/add' />'>
                                    	<input type="hidden" name="countRow" id="countRowCDR">
                                        <fieldset title="1">
                                            <legend>Thêm Chuẩn Đầu Ra Học Phần</legend>
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
                                            <table class="table text-center table-bordered" id="chuan-dau-ra-hoc-phan-table">
											    <thead>
											      <tr>
											        <th class="col-md-1 text-center">Chuẩn đầu ra (L.O.x.x) [1]</th>
											        <th class="col-md-2 text-center">Mô tả chuẩn đầu ra [2]</th>
											        <th class="col-md-2 text-center">Mục tiêu của học phần (3)</th>
											        <th class="col-md-2 text-center">Mức độ giảng dạy I, T, U (4)</th>
											        <th class="col-md-1 text-center">Action</th>
											      </tr>
											    </thead>
											    <tbody>
											    	<c:choose>
		                                            	<c:when test="${not empty chuandaurahp}">
		                                            		<c:forEach items="${chuandaurahp}" var="item" varStatus="loop">
														    	<tr id="old-row" disabled>
															        <td class="ten">
															        	<span class="form-control">${item.ten}</span>
															        	<input type="hidden" name="cdrid" value="${item.id}">
															        </td>
															        <td>
															        	<span class="form-control">
															        		${item.moTa}
															        	</span>
															        </td>
															        <td>
															        	<span class="form-control">
															        		<c:forEach items="${muctieuhp}" var="item">
					                                                        	<label class="checkbox-inline">
																			      <input type="checkbox" name="chuanDauRa0" id="cdrhp" value="${item.id}">${item.ten}
																			    </label>
					                                                     	</c:forEach>
															        	</span>
															        </td>
															        <td>
															        	<select name="mucDoGiangDay" class="form-control">
															        		<option value="I">I</option>
															        		<option value="T">T</option>
															        		<option value="U">U</option>
															        	</select>
															        </td>
															        <td>
															        	<button type="button" id="delete-row" class="btn-xs btn-danger delete-row">
															        		<span class="fa fa-remove"></span>
															        	</button>
															        </td>
															    </tr>
														    </c:forEach>
		                                            	</c:when>
		                                            </c:choose>
											    </tbody>
										  	</table>
                                        </fieldset>
                                        <button type="submit" class="btn btn-primary stepy-finish pull-right">Submit</button>
                                        <div class="row">
                                        <blockquote class="blockquote">
                                        	<ul>
                                        		<li>I: Introduce (Giới thiệu)</li>
                                        		<li>T: Teach (Dạy)</li>
                                        		<li>U: Utilize (Sử dụng)</li>
                                        	</ul>
                                        </blockquote>
                                        </div>
                                        
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

