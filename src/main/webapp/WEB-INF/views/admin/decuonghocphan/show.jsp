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
                                            <a href="#">Chương Trình Đào Tạo</a>
                                        </li>
                                        <li>
                                            <a href="#">${ctdtId}</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li>
                                            <a href="#">${hocphan.vi_name}</a>
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
                                            <div style='font-size: 24px'class="body-header-left">Đề Cương Học Phần <span class="label label-info">${hocphan.vi_name}</span></div>	
                                    		<div class="col-md-4 body-header-right btn btn-primary">
                                    			<a href="<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/export'/>" class="btn btn-primary">
                                    				<strong>XUẤT</strong> ĐỀ CƯƠNG CHI TIẾT HỌC PHẦN
                                    			</a>
                                    		</div>
											<br> <br> <hr>
                                            <div style="clear: both;"></div>
                                            <div class="row m-t-20">
                                            	<div class="form-group">
                                            		<div class="form-group col-sm-6">
                                                        <label for="hocphan">Tên Học Phần</label>
                                                    	<div>${hocphan.vi_name}</div>
                                                    </div>
                                                    <div class="form-group col-sm-6">
                                                        <label for="hocphan">Subject's Name</label>
                                                    	<div>${hocphan.en_name}</div>
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
                                                		<c:when test="${not empty muctieuhp}">
                                                		 <table class="table text-center table-bordered" id="muc-tieu-hoc-phan-table">
														    <thead>
														      <tr>
														        <th class="col-md-1 text-center">Mục Tiêu (1)</th>
														        <th class="col-md-4 text-center">Mô tả mục tiêu (2)</th>
														        <th class="col-md-2 text-center">Chuẩn đầu ra của CTĐT (3)</th>
														        <th class="col-md-3 text-center">TĐNL (4)</th>
														        <th class="col-md-3 text-center">Action</th>
														      </tr>
														    </thead>
														    <tbody>
														    	<c:forEach items="${muctieuhp}" var="item" varStatus="loop">
															    	<tr id="standard-row">
																        <td class="muc-tieu">
																        	<input type="text" id="muc-tieu" name="ten" class="form-control" value="${item.ten}" disabled/>
																        </td>
																        <td id="mo-ta-element">
																        	<textarea class="form-control hidden" rows="2" name="moTa" id="mo_ta" required>
																        		${item.moTa}
																        	</textarea>
																        	<span>
																        		${item.moTa}
																        	</span>
																        </td>
																        <td>
																        	<span>
																        		${chuanDauRa.get(loop.count-1).chuanDauRa}
																        	</span>
																        </td>
																        <td id="trinh-do">
																        	<input type="text" class="form-control hidden" name="trinhDoNangLuc" value="${item.trinhDoNangLuc}" required>
																        	<span>
																        		${item.trinhDoNangLuc}
																        	</span>
																        </td>
																        <td>
																        	<button type="button" value="${decuonghocphan.id}" data-item="${item.id}" class="btn btn-warning" name="edit-muctieu" id="edit-muctieu">
																        		<i class="fa fa-pencil-square-o" aria-hidden="true"></i>
																        	</button>
																        	<button type="button" class="btn btn-success hidden" id="apply-muctieu">
																        		<i class="fa fa-check" aria-hidden="true"></i>
																        	</button>
																        	<button type="reset" class="btn btn-danger hidden" id="cancel-muctieu">
																        		<i class="fa fa-remove" aria-hidden="true"></i>
																        	</button>
																        </td>
																    </tr>
															    </c:forEach>
														    </tbody>
													  	</table>
													  	</c:when>
                                                	</c:choose>
                                                	<div class="form-group">
                                                		<a href='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/${decuonghocphan.id}/muctieu/add' />' class="btn btn-primary">
															<span>Thêm Mục Tiêu Học Phần</span>
														</a>
                                                	</div>
                                                </div>
                                                <div class="form-group col-sm-12">
                                                	<label>Nguồn Học Liệu</label>
                                                	<c:choose>
                                                		<c:when test="${not empty nguonhoclieu}">
                                                		 <table class="table text-center table-bordered" id="muc-tieu-hoc-phan-table">
														    <thead>
														      <tr>
														        <th class="col-md-4 text-center">Tên Học Liệu</th>
														        <th class="col-md-2 text-center">Loại Học Liệu</th>
														      </tr>
														    </thead>
														    <tbody>
														    	<c:forEach items="${nguonhoclieu}" var="item" varStatus="loop">
															    	<tr>
																        <td>
																        	<span>${item.tenHocLieu}</span>
																        </td>
																        <td>
																        	<span>
																        		<c:if test="${item.loaiHocLieuId == 1}">Giáo Trình</c:if>
																        		<c:if test="${item.loaiHocLieuId == 2}">Tài Liệu Khác</c:if>
																        	</span>
																        </td>
																    </tr>
															    </c:forEach>
														    </tbody>
													  	</table>
													  	</c:when>
                                                	</c:choose>
                                                	<div class="form-group">
                                                		<a href='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/${decuonghocphan.id}/nguonhoclieu/add' />' class="btn btn-primary">
															<span>Thêm Nguồn Học Liệu</span>
														</a>
                                                	</div>
                                                </div>
                                                <div class="form-group col-sm-12">
                                                	<label>Nguồn Học Liệu</label>
                                                	<c:choose>
		                                            	<c:when test="${not empty chuandaurahp}">
		                                            		<table class="table text-center table-bordered" id="muc-tieu-hoc-phan-table">
															    <thead>
															      <tr>
															        <th class="col-md-1 text-center">Chuẩn đầu ra (L.O.x.x) [1]</th>
															        <th class="col-md-2 text-center">Mô tả chuẩn đầu ra [2]</th>
															        <th class="col-md-2 text-center">Mục tiêu của học phần (3)</th>
															        <th class="col-md-2 text-center">Mức độ giảng dạy I, T, U (4)</th>
															      </tr>
															    </thead>
														    	<tbody>
			                                            		<c:forEach items="${chuandaurahp}" var="item" varStatus="loop">
															    	<tr id="old-row" disabled>
																        <td class="ten">
																        	<span class="form-control" disabled>${item.ten}</span>
																        </td>
																        <td>
																        		${item.moTa}
																        </td>
																        <td>
																        	<span class="form-control" disabled>
																        		<c:forEach items="${muctieutuongung}" var="item2" varStatus="loop">
															        				<c:if test="${item2.chuanDauRaId == item.id}">
															        					${item2.mucTieuHocPhan}
															        				</c:if>
																        		</c:forEach>
																        	</span>
																        </td>
																        <td>
																        	<span class="form-control" disable>
																        		<c:set var="count" value="${1}"/>
																        		<c:forEach items="${mucdogiangday}" var="item2" varStatus="loop">
															        				<c:if test="${item2.chuanDauRaHocPhanId == item.id && count<2}">
															        					${item2.mucDoGiangDay}
															        					<c:set var="count" value="${2}"/>
															        				</c:if>
																        		</c:forEach>
																        	</span>
																        </td>
																    </tr>
															    </c:forEach>
															    </tbody>
															    </table>
		                                            	</c:when>
		                                            </c:choose>
                                                	<div class="form-group">
                                                		<a href='<c:url value='/ctdt/${ctdtId}/hocphan/${hocphan.id}/decuong/${decuonghocphan.id}/chuandaurahp/add' />' class="btn btn-primary">
															<span>Thêm Chuẩn Đầu Ra Học Phần</span>
														</a>
                                                	</div>
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
                    2017 © Admin. - daotao.dut.udn
                </footer>

            </div>


            <!-- ============================================================== -->
            <!-- End Right content here -->
            <!-- ============================================================== -->

