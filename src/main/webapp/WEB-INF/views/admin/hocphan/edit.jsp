<script type="text/javascript">
            function checkform(form){                            
                    // BƯỚC 1: Lấy dữ liệu từ form
                    var vi_name       = $.trim($('#vi_name').val());
                    var en_name       = $.trim($('#en_name').val());
                    var ma_hoc_phan   = $.trim($('#ma_hoc_phan').val());
                    var loai_hoc_phan = $.trim($('#loai_hoc_phan').val());
             
                    // BƯỚC 2: Validate dữ liệu
                    // Biến cờ hiệu
                    var flag = true;
             
                    // vi_name
                    if (vi_name == ''){
                        $('#vi_name_error').text('Tên tiếng việt học phần không được để trống.');                      
                        flag = false;
                    }
                    else{
                        $('#vi_name_error').text('');
                    }
             
                    // en_name
                    if (en_name == ''){
                        $('#en_name_error').text('Tên tiếng anh học phần không được để trống.');
                        flag = false;
                    }
                    else{
                        $('#en_name_error').text('');
                    }
             
                    // ma_hoc_phan
                    if (ma_hoc_phan == ''){
                        $('#ma_hoc_phan_error').text('Mã học phần không được để trống.');
                        flag = false;
                    }
                    else{
                        $('#ma_hoc_phan_error').text('');
                    }
                    
                 // loai_hoc_phan
                    if (loai_hoc_phan == ''){
                        $('#loai_hoc_phan_error').text('Loại học phần không được để trống.');
                        flag = false;
                    }
                    else{
                        $('#loai_hoc_phan_error').text('');
                    }
                    return flag;       
            }
</script>
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
                                    <h4 class="page-title">Sửa Học Phần</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">DUT</a>
                                        </li>
                                        <li>
                                            <a href="#">Học Phần</a>
                                        </li>
                                        <li class="active">
                                            Sửa
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
                                <c:url var="addUrl" value='/hocphan/edit/${hocphan.id}'/>
                                    <form:form onsubmit="return checkform(this);" id="default-wizard" method="post" modelAttribute="hocphan" action='${addUrl}'>
                                        <fieldset title="1">
                                            <legend>Sửa Học Phần</legend>
                                            <c:if test="${param['msg'] eq '2'}">
												<div class="alert alert-danger" role="alert">
												  <span class="glyphicon glyphicon-exclamation-sign" aria-hidden="true"></span>
												  <span class="sr-only">Error:</span>
												  Chỉnh sửa học phần thất bại
												</div>
											</c:if>                                           
                                            <div class="row m-t-20">
                                                <div class="col-sm-6">
                                                	<form:input type="hidden" path="id"></form:input>
                                                    <div class="form-group">
                                                        <label for="vi_name">Tên Tiếng Việt</label>
                                                        <form:input type="text" class="form-control" id="vi_name" path="vi_name" placeholder=""/>
                                                        <span style="color: red" id="vi_name_error"></span>
                                                    </div>
													<div class="form-group">
                                                        <label for="vi_name">Tên Tiếng Anh</label>
                                                        <form:input type="text" class="form-control" id="en_name" path="en_name"  placeholder=""/>
                                                        <span style="color: red" id="en_name_error"></span>
                                                    </div>
													<div class="form-group">
                                                        <label for="en_name">Mã Học Phần</label>
                                                        <form:input type="text" class="form-control" id="ma_hoc_phan" path="ma_hoc_phan" placeholder=""/>
                                                        <span style="color: red" id="ma_hoc_phan_error"></span>
                                                    </div>
													<div class="form-group">
                                                        <label for="ma_hoc_phan">Loại Học Phần</label>
                                                        <form:input type="text" class="form-control" id="loai_hoc_phan" path="loai_hoc_phan" placeholder=""/>
                                                        <span style="color: red" id="loai_hoc_phan_error"></span>
                                                    </div>
													<div class="form-group">
                                                        <label for="loai_hoc_phan">Khối Kiến Thức</label>
                                                        <form:select class="form-control select2" id="khoi_kien_thuc_id" path="khoi_kien_thuc_id">
															<c:forEach items="${requestScope.listkkt}" var="kkt">
																<form:option selected="${hocphan.khoi_kien_thuc_id == kkt.id ? 'selected' : '' }" value="${kkt.id }">${kkt.ten}</form:option>
															</c:forEach>
														</form:select>
                                                    </div>
													<div class="form-group">
                                                        <label for="khoi_kien_thuc_id">Số Tín Chỉ</label>
                                                        <form:input type="number" class="form-control" id="so_tin_chi" path="so_tin_chi" placeholder=""/>
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

