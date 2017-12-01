<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <!-- Top Bar Start -->
            <div class="topbar">
                <!-- LOGO -->
                <div class="topbar-left">
                    <!--<a href="index.jsp" class="logo"><span>Code<span>Fox</span></span><i class="mdi mdi-layers"></i></a>-->
                    <!-- Image logo -->
                    <a href="<c:url value="/" />" class="">
                        
                    </a>
                </div>

                <!-- Button mobile view to collapse sidebar menu -->
                <div class="navbar navbar-default" role="navigation">
                    <div class="container">

                        <!-- Navbar-left -->
                        <ul class="nav navbar-nav navbar-left nav-menu-left">
                            <li>
                                <button type="button" class="button-menu-mobile open-left waves-effect">
                                    <i class="dripicons-menu"></i>
                                </button>
                            </li>                         
                        </ul>

                        <!-- Right(Notification) -->
                        <ul class="nav navbar-nav navbar-right">
                            <!-- <li class="hidden-xs">
                                <form role="search" class="app-search">
                                    <input type="text" placeholder="Search..."
                                           class="form-control">
                                    <a href="#"><i class="fa fa-search"></i></a>
                                </form>
                            </li> -->
                            <li>
                                <a href="#" class="right-menu-item dropdown-toggle" data-toggle="dropdown">
                                    <i class="dripicons-bell"></i>
                                    <span class="badge badge-pink">1</span>
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right dropdown-lg user-list notify-list">
                                    <li class="list-group notification-list m-b-0">
                                        <div class="slimscroll">
                                           <!-- list item-->
                                           <a href="javascript:void(0);" class="list-group-item">
                                              <div class="media">
                                                 <div class="media-left p-r-10">
                                                    <em class="fa fa-diamond bg-primary"></em>
                                                 </div>
                                                 <div class="media-body">
                                                    <h5 class="media-heading text-primary">A new order has been placed A new order has been placed</h5>
                                                    <p class="m-0">
                                                        There are new settings available
                                                    </p>
                                                 </div>
                                              </div>
                                           </a>
                                       </div>
                                    </li>
                                    <!-- end notification list -->
                                </ul>
                            </li>

                            <li class="dropdown user-box">
                                <a href="#" class="dropdown-toggle waves-effect user-link" data-toggle="dropdown" aria-expanded="true">
                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-1.jpg'/>" alt="user-img" class="img-circle user-img">
                                </a>

                                <ul class="dropdown-menu dropdown-menu-right arrow-dropdown-menu arrow-menu-right user-list notify-list">
                                    <li><a href="javascript:void(0)">Profile</a></li>
                                    <li><a href="javascript:void(0)"><span class="badge badge-info pull-right">4</span>Settings</a></li>
                                    <li><a href="javascript:void(0)">Lock screen</a></li>
                                    <li class="divider"></li>
                                    <li><a href="javascript:void(0)">Logout</a></li>
                                </ul>
                            </li>

                        </ul> <!-- end navbar-right -->

                    </div><!-- end container -->
                </div><!-- end navbar -->
            </div>
            <!-- Top Bar End -->