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
                                <a href="<c:url value="/ctdt" />" aria-expanded="true"><i class="fi-air-play"></i><span>Chương trình đào tạo </span></a>
                            </li>

                            <li>
                                <a href="<c:url value="/hocphan" />" aria-expanded="true"><i class="fi-briefcase"></i> <span>Học Phần </span></a>
                            </li>
							
							<li>
                                <a href="<c:url value="/giangvien" />"><i class="fi-help"></i> <span>Giảng Viên </span></a>
                            </li>
                        </ul>
                    </div>
                    <!-- Sidebar -->
                    <div class="clearfix"></div>
                </div>
                <!-- Sidebar -left -->
            </div>
            <!-- Left Sidebar End -->       