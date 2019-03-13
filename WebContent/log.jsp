<%@ page language="java" import="java.util.*,com.hyw.model.*" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="utf-8">
	<title>ChatRoom</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1, user-scalable=no">
	<meta name="description" content="">
	<meta name="author" content="">
	<!-- STYLESHEETS --><!--[if lt IE 9]><script src="cl/js/flot/excanvas.min.js"></script><script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script><script src="http://css3-mediaqueries-js.googlecode.com/svn/trunk/css3-mediaqueries.js"></script><![endif]-->
	<link rel="stylesheet" type="text/css" href="cl/css/cloud-admin.css" >
	<link rel="stylesheet" type="text/css"  href="cl/css/themes/default.css" id="skin-switcher" >
	<link rel="stylesheet" type="text/css"  href="cl/css/responsive.css" >
	
	<link href="cl/font-awesome/css/font-awesome.min.css" rel="stylesheet">
	<!-- DATE RANGE PICKER -->
	<link rel="stylesheet" type="text/css" href="cl/js/bootstrap-daterangepicker/daterangepicker-bs3.css" />
	<!-- FONTS -->
	<link href='http://fonts.useso.com/css?family=Open+Sans:300,400,600,700' rel='stylesheet' type='text/css'>
</head>
<body>
<%
 List list=(List)request.getAttribute("list");

%>
	<!-- HEADER -->
	<header class="navbar clearfix" id="header">
		<div class="container">
				<div class="navbar-brand">
					<!-- COMPANY LOGO -->
					<a href="index.html">
						<span style="color:#FFFFFF">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp ChatRoom 聊天室</span>				
					</a>
					<!-- /COMPANY LOGO -->
					<!-- TEAM STATUS FOR MOBILE -->
					<div class="visible-xs">
						<a href="#" class="team-status-toggle switcher btn dropdown-toggle">
							<i class="fa fa-users"></i>
						</a>
					</div>
					<!-- /TEAM STATUS FOR MOBILE -->
					<!-- SIDEBAR COLLAPSE -->
					<div id="sidebar-collapse" class="sidebar-collapse btn">
						<i class="fa fa-bars" 
							data-icon1="fa fa-bars" 
							data-icon2="fa fa-bars" ></i>
					</div>
					<!-- /SIDEBAR COLLAPSE -->
				</div>
				<!-- NAVBAR LEFT -->
				<ul class="nav navbar-nav pull-left hidden-xs" id="navbar-left">
					<li class="dropdown">
						<a href="#" class="team-status-toggle dropdown-toggle tip-bottom" data-toggle="tooltip" title="Toggle Team View">
							<i class="fa fa-users"></i>
							<span class="name">Team Status</span>
							<i class="fa fa-angle-down"></i>
						</a>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-cog"></i>
							<span class="name">Skins</span>
							<i class="fa fa-angle-down"></i>
						</a>
						<ul class="dropdown-menu skins">
							<li class="dropdown-title">
								<span><i class="fa fa-leaf"></i> Theme Skins</span>
						 </ul>
					</li>
				</ul>
				<!-- /NAVBAR LEFT -->
				<!-- BEGIN TOP NAVIGATION MENU -->					
				<ul class="nav navbar-nav pull-right">
					<!-- BEGIN NOTIFICATION DROPDOWN -->	
					<li class="dropdown" id="header-notification">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<i class="fa fa-bell"></i>
							<span class="badge">7</span>
							
						</a>
						<ul class="dropdown-menu notification">	
						</ul>
					</li>
					<!-- END NOTIFICATION DROPDOWN -->
					<!-- BEGIN INBOX DROPDOWN -->
					<li class="dropdown" id="header-message">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-envelope"></i>
						<span class="badge">3</span>
						</a>
						<ul class="dropdown-menu inbox">
						</ul>
					</li>
					<!-- END INBOX DROPDOWN -->
					<!-- BEGIN TODO DROPDOWN -->
					<li class="dropdown" id="header-tasks">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
						<i class="fa fa-tasks"></i>
						<span class="badge">3</span>
						</a>
						<ul class="dropdown-menu tasks">	
						</ul>
					</li>
					<!-- END TODO DROPDOWN -->
					<!-- BEGIN USER LOGIN DROPDOWN -->
					<li class="dropdown user" id="header-user">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
							<img alt="" src="assets/images/mei.png" />
							<span class="username">You</span>
							<i class="fa fa-angle-down"></i>
						</a>		
					</li>
					<!-- END USER LOGIN DROPDOWN -->
				</ul>
				<!-- END TOP NAVIGATION MENU -->
		</div>
		<!-- TEAM STATUS -->
		<div class="container team-status" id="team-status">
		  <div id="scrollbar">
			<div class="handle">
			</div>
		  </div>
		  <div id="teamslider">
			  <ul class="team-list">
			  </ul>
			</div>
		  </div>
		<!-- /TEAM STATUS -->
	</header>
	<!--/HEADER -->
	<!-- PAGE -->
	<section id="page">
				<!-- SIDEBAR -->
				<div id="sidebar" class="sidebar">
					<div class="sidebar-menu nav-collapse">
						<div class="divide-20"></div>
						<!-- SEARCH BAR -->
						<div id="search-bar">
							<input class="search" type="text" placeholder="Search"><i class="fa fa-search search-icon"></i>
						</div>
						<!-- /SEARCH BAR -->					
						<!-- SIDEBAR MENU -->
						<ul>							
							<li><a class="" href="user.jsp"><i class="fa fa-pencil-square-o fa-fw"></i> <span class="menu-text">个人主页</span></a></li>					
                            <li class="has-sub">
								<a href="javascript:;" class="">
								<i class="fa fa-envelope-o fa-fw"></i> <span class="menu-text">聊天室</span>
								<span class="arrow"></span>
								</a>
								<ul class="sub">
									<li><a class="" href="chat.jsp"><span class="sub-menu-text">公聊</span></a></li>
									<li><a class="" href="privacy.jsp"><span class="sub-menu-text">私聊</span></a></li>
								</ul>
							</li>
							<li><a class="" href="log"><i class="fa fa-th-large fa-fw"></i> <span class="menu-text">系统日志</span></a></li>	
                            <li><a class="" href="exitservlet"><i class="fa fa-briefcase fa-fw"></i> <span class="menu-text">退出</span></a></li>
						</ul>
						<!-- /SIDEBAR MENU -->
					</div>
				</div>
				<!-- /SIDEBAR -->
		<div id="main-content">
			<div class="container">
				<div class="row">
					<div id="content" class="col-lg-12">
						<!-- PAGE HEADER-->
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<!-- STYLER -->
									
									<!-- /STYLER -->
									<!-- BREADCRUMBS -->
									<ul class="breadcrumb">
										<li>
											<i class="fa fa-home"></i>
											<a href="index.html">Home</a>
										</li>
										<li>
											<a href="#">Other Pages</a>
										</li>
										<li>Log Page</li>
									</ul>
									<!-- /BREADCRUMBS -->
									<div class="clearfix">
										<h3 class="content-title pull-left">Log Page</h3>
									</div>
								</div>
							</div>
						</div>
						<!-- /PAGE HEADER -->
                        	<!-- PAGE MAIN CONTENT -->
                          <div class="col-md-7">
								<!-- BOX -->
								<div class="box border orange">
									<div class="box-title">
										<h4><i class="fa fa-hand-o-up"></i>系统日志</h4>
										<div class="tools">
											<a href="#box-config" data-toggle="modal" class="config">
												<i class="fa fa-cog"></i>
											</a>
											<a href="javascript:;" class="reload">
												<i class="fa fa-refresh"></i>
											</a>
											<a href="javascript:;" class="collapse">
												<i class="fa fa-chevron-up"></i>
											</a>
											<a href="javascript:;" class="remove">
												<i class="fa fa-times"></i>
											</a>
										</div>
									</div>
									<div class="box-body">
										<table class="table table-hover">
											<thead>
											  <tr>
												<th>#</th>
												<th>用户名</th>
												<th>时间</th>
												<th>状态</th>
											  </tr>
											</thead>
											<tbody>
											<%

for (int i=0;i<list.size();i++){ 
Log t=(Log)list.get(i);%>
<tr><td><%=i+1%></td><td> 
<%=t.getUsername()%></td><td>
<%=t.getTime()%></td><td>
<%=t.getStatus()%></td></tr>
<%
}
%>
											
											  
											</tbody>
										  </table>
									</div>
								</div>
								<!-- /BOX -->
							</div>
						</div>
						<!-- /BORDERED HOVER -->
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--/PAGE -->
	<!-- JAVASCRIPTS -->
	<!-- Placed at the end of the document so the pages load faster -->
	<!-- JQUERY -->
	<script src="cl/js/jquery/jquery-2.0.3.min.js"></script>
	<!-- JQUERY UI-->
	<script src="cl/js/jquery-ui-1.10.3.custom/js/jquery-ui-1.10.3.custom.min.js"></script>
	<!-- BOOTSTRAP -->
	<script src="cl/bootstrap-dist/js/bootstrap.min.js"></script>
	
		
	<!-- DATE RANGE PICKER -->
	<script src="cl/js/bootstrap-daterangepicker/moment.min.js"></script>
	
	<script src="cl/js/bootstrap-daterangepicker/daterangepicker.min.js"></script>
	<!-- SLIMSCROLL -->
	<script type="cl/text/javascript" src="js/jQuery-slimScroll-1.3.0/jquery.slimscroll.min.js"></script><script type="text/javascript" src="cl/js/jQuery-slimScroll-1.3.0/slimScrollHorizontal.min.js"></script>
	<!-- COOKIE -->
	<script type="cl/text/javascript" src="js/jQuery-Cookie/jquery.cookie.min.js"></script>
	<!-- CUSTOM SCRIPT -->
	<script src="cl/js/script.js"></script>
	<script>
		jQuery(document).ready(function() {		
			App.setPage("widgets_box");  //Set current page
			App.init(); //Initialise plugins and elements
		});
	</script>
	<!-- /JAVASCRIPTS -->
</body>
</html>