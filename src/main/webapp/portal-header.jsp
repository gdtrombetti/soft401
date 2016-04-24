<!DOCTYPE meta PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- stylesheets -->
	<link rel="stylesheet" href="lib/assets/css/style.css" type="text/css">
	<link rel="stylesheet" href="lib/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="lib/assets/css/animate.css">
	<link rel="stylesheet" href="lib/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="lib/assets/css/owl.theme.css">
	<link rel="stylesheet" href="lib/assets/css/bootstrap.min.css" type="text/css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
	<!-- scripts -->
	
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="lib/assets/js/modernizr.custom.97074.js"></script>
	<script type="text/javascript" src="lib/assets/js/script.js"></script>
	<script type="text/javascript" src="lib/assets/js/controllers/card-set-controller.js"></script>
	
<%@ page language="java" 
         contentType="text/html; charset=windows-1256"
         pageEncoding="windows-1256"
         import="UserData.User"
         
%>
<%
    response.setHeader("Cache-Control","no-store,must-revalidate"); 
    response.setHeader("Pragma","no-cache"); 
    response.setDateHeader ("Expires", -1); 
    new java.util.Date();
    User user2 = (User)(session.getAttribute("currentSessionUser"));
    	
    %>
<div id="home-page-portal">
	<nav id="mainNavigation" class="navbar navbar-dafault main-navigation" role="navigation">
                <div class="container">
                    
                    <div class="navbar-header">
                        
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#main-nav-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        
                        <!-- navbar logo -->
                        <div class="navbar-brand">
                            <span class="sr-only">WeStudy</span>
                            <a href="index.jsp">
                                <img src="lib/assets/img/logo2.png" class="img-responsive center-block" alt="logo">
                            </a>  
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-right text-uppercase">
                            <li>
                            	<a>Welcome, <%= user2.getFull_name() %></a>
                            </li>
                            <li>
                            <%
                           
                            
                            if(user2.getType().equals("1"))
    							{
                            %>
                           		<a href="portal-basic.jsp"> Home
                            <% } else if (user2.getType().equals("2")) {
                            %>
                            	<a href="portal-admin.jsp"> Home
                            <%	
                            } else {
                            %>
                            	<a href="portal-admin.jsp">
                            <% 
                            }
                            %>
                            </a>
                            </li>

                            <li>
                                <a href="SignOutUserServlet">Sign Out</a>
                            </li>  
                        </ul>
                    </div><!-- nav links -->
                </div><!-- /.container -->
            </nav>
           </div>
      	</div>
      </head>