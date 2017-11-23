<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>		
          <!-- ========== Left Sidebar Start ========== -->
            <div class="left side-menu">
                <div class="slimscroll-menu" id="remove-scroll">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metisMenu nav" id="side-menu">
                            <li class="menu-title">Navigation</li>
                            <li>
                                <a href="trangchu.jsp" aria-expanded="true"><i class="fi-air-play"></i><span> Trang Chủ </span></a>
                            </li>

                            <li>
                                <a href="javascript: void(0);" aria-expanded="true"><i class="fi-target"></i> <span> Quản Lí Đào Tạo </span><span class="menu-arrow"></span></a>
								<ul class="nav-second-level nav" aria-expanded="true">
									<li><a href="dschuongtrinhdaotao.jsp">Danh Sách Chương Trình Đào Tạo</a></li>
                                    <li><a href="themchuongtrinhdaotao.jsp">Thêm Chương Trình Đào Tạo</a></li>
								</ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" aria-expanded="true"><i class="fi-briefcase"></i> <span> Quản Lí Học Phần </span><span class="menu-arrow"></span></a>
								<ul class="nav-second-level nav" aria-expanded="true">
									<li><a href='<c:url value="/hocphan" />'>Danh Sách Học Phần</a></li>
                                    <li><a href='<c:url value="/hocphan/add" />'>Thêm Học Phần</a></li>
								</ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);"><i class="fi-help"></i> <span> Quản Lí Tài Liệu </span><span class="menu-arrow"></span></a>
								<ul class="nav-second-level nav" aria-expanded="true">
									<li><a href="dstailieu.jsp">Danh Sách Tài Liệu</a></li>
                                    <li><a href="themtailieu.jsp">Thêm Tài Liệu</a></li>
								</ul>
                            </li>
							
							<li>
                                <a href="javascript: void(0);"><i class="fi-help"></i> <span> Quản Lí Giảng Viên </span><span class="menu-arrow"></span></a>
								<ul class="nav-second-level nav" aria-expanded="true">
									<li><a href="dsgiangvien.jsp">Danh Sách Giảng Viên</a></li>
									<li><a href="themgiangvien.jsp">Thêm Giảng Viên</a></li>
								</ul>
                            </li>
                        </ul>
                    </div>
                    <!-- Sidebar -->
                    <div class="clearfix"></div>
                </div>
                <!-- Sidebar -left -->
            </div>
            <!-- Left Sidebar End -->       