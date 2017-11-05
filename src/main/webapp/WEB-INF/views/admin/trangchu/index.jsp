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
                                    <h4 class="page-title">Dashboard</h4>
                                    <ol class="breadcrumb p-0 m-0">
                                        <li>
                                            <a href="#">Adminox</a>
                                        </li>
                                        <li>
                                            <a href="#">Dashboard</a>
                                        </li>
                                        <li class="active">
                                            Dashboard 1
                                        </li>
                                    </ol>
                                    <div class="clearfix"></div>
                                </div>
							</div>
						</div>
                        <!-- end row -->

                        <div class="row">

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-custom">
                                    <i class="mdi mdi-currency-usd widget-two-icon"></i>
                                    <div class="wigdet-two-content">
                                        <p class="m-0 text-uppercase font-bold font-secondary text-overflow" title="Statistics">Total Revenue</p>
                                        <h2 class=""><span><i class="mdi mdi-arrow-up"></i></span> <span data-plugin="counterup">65841</span></h2>
                                        <p class="m-0">Jan - Apr 2017</p>
                                    </div>
                                </div>
                            </div><!-- end col -->

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-custom">
                                    <i class="mdi mdi-account-multiple widget-two-icon"></i>
                                    <div class="wigdet-two-content">
                                        <p class="m-0 text-uppercase font-bold font-secondary text-overflow" title="Statistics">Total Unique Visitors</p>
                                        <h2 class=""><span><i class="mdi mdi-arrow-up"></i></span> <span data-plugin="counterup">236521</span></h2>
                                        <p class="m-0">Jan - Apr 2017</p>
                                    </div>
                                </div>
                            </div><!-- end col -->

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-custom">
                                    <i class="mdi mdi-crown widget-two-icon"></i>
                                    <div class="wigdet-two-content">
                                        <p class="m-0 text-uppercase font-bold font-secondary text-overflow" title="Statistics">Number of Transactions</p>
                                        <h2 class=""><span><i class="mdi mdi-arrow-up"></i></span> <span data-plugin="counterup">563698</span></h2>
                                        <p class="m-0">Jan - Apr 2017</p>
                                    </div>
                                </div>
                            </div><!-- end col -->

                            <div class="col-lg-3 col-md-6">
                                <div class="card-box widget-box-two widget-two-custom">
                                    <i class="mdi mdi-auto-fix widget-two-icon"></i>
                                    <div class="wigdet-two-content">
                                        <p class="m-0 text-uppercase font-bold font-secondary text-overflow" title="Statistics">Conversation Rate</p>
                                        <h2 class=""><span><i class="mdi mdi-arrow-up"></i></span> <span data-plugin="counterup">2.07</span>%</h2>
                                        <p class="m-0">Jan - Apr 2017</p>
                                    </div>
                                </div>
                            </div><!-- end col -->

                        </div>
                        <!-- end row -->
						
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card-box">
                                    <h4 class="m-t-0 header-title"><b>Recent Candidates</b></h4>
                                    <p class="text-muted font-14 m-b-20">
                                        Your awesome text goes here.
                                    </p>

                                    <div class="table-responsive">
                                        <table class="table table-hover m-0 mails table-actions-bar">

                                            <thead>
                                            <tr>
                                                <th>
                                                    <div class="btn-group dropdown">
                                                        <button type="button" class="btn btn-default btn-xs dropdown-toggle waves-effect waves-light" data-toggle="dropdown" aria-expanded="false"><i class="caret"></i></button>
                                                        <ul class="dropdown-menu" role="menu">
                                                            <li><a href="#">Action</a></li>
                                                            <li><a href="#">Another action</a></li>
                                                            <li><a href="#">Something else here</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#">Separated link</a></li>
                                                        </ul>
                                                    </div>
                                                </th>
                                                <th>Name</th>
                                                <th>Location</th>
                                                <th>Job Timing</th>
                                                <th>Salary</th>
                                                <th>Action</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>
                                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-2.jpg'/>" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-b-0 m-t-0">Tomaslau</h5>
                                                    <p class="m-b-0"><small>Web Designer</small></p>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> New York
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-clock text-success"></i> Full Time
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-currency-usd text-warning"></i> 3265
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-3.jpg'/>" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-b-0 m-t-0">Erwin E. Brown</h5>
                                                    <p class="m-b-0"><small>Programmer</small></p>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> California
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-clock text-success"></i> Part Time
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-currency-usd text-warning"></i> 1365
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-4.jpg'/>" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-b-0 m-t-0">Margeret V. Ligon</h5>
                                                    <p class="m-b-0"><small>Web Designer</small></p>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> New York
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-clock text-success"></i> Full Time
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-currency-usd text-warning"></i> 115248
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-5.jpg'/>" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-b-0 m-t-0">Jose D. Delacruz</h5>
                                                    <p class="m-b-0"><small>Web Developer</small></p>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> New York
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-clock text-success"></i> Part Time
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-currency-usd text-warning"></i> 2451
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td>
                                                    <img src="<c:url value='/resources/admin/bootstrap/images/users/avatar-8.jpg'/>" alt="contact-img" title="contact-img" class="img-circle thumb-sm" />
                                                </td>

                                                <td>
                                                    <h5 class="m-b-0 m-t-0">Luke J. Sain</h5>
                                                    <p class="m-b-0"><small>Web Designer</small></p>
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-map-marker text-primary"></i> Australia
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-clock text-success"></i> Part Time
                                                </td>

                                                <td>
                                                    <i class="mdi mdi-currency-usd text-warning"></i> 3265
                                                </td>

                                                <td>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-pencil"></i></a>
                                                    <a href="#" class="table-action-btn"><i class="mdi mdi-close"></i></a>
                                                </td>
                                            </tr>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>

                            </div>
                            <!-- end col -->                           
                        </div>
                        <!--- end row -->




                    </div> <!-- container -->

                </div> <!-- content -->

                <footer class="footer text-right">
                    2017 © Admin. - daotao.dut.udn
                </footer>

            </div>



        