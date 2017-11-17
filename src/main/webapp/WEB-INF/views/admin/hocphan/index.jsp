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
                                    <h4 class="page-title">Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li class="active">
                                            Danh sách Học Phần
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
                                    <h4 class="m-t-0 header-title"><b>Danh Sách Học Phần</b></h4>
                                        <table class="table table-hover m-0 mails table-actions-bar">
                                            <thead>
                                            <tr>
                                                <th>Tên Tiếng Việt</th>
                                                <th>Tên Tiếng Anh</th>
                                                <th>Mã Học Phần</th>
                                                <th>Loại Học Phần</th>
                                                <th>Số Tín Chỉ</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>                                                                                        
		                                        <c:forEach items="${requestScope.list}" var="i">
		                                            <tr>
		                                                <td>${i.vi_name}</td>
		
		                                                <td>${i.en_name}</td>
		
		                                                <td>${i.ma_hoc_phan}</td>
		
		                                                <td>${i.loai_hoc_phan}</td>
		                                                
		                                                <td>${i.so_tin_chi}</td>
		
		                                                <td>
		                                                	<a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    		<a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
		                                                </td>
													</tr> 
												</c:forEach>	                                                                                  		
                                            </tbody>
                                        </table>
                                    </div>
                                </div> 							                        
                        </div>
                        <!--- end row -->
                    </div> <!-- container -->
                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 © Adminox. - Coderthemes.com
                </footer>

            </div>