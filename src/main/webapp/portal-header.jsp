<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<!-- stylesheets -->
	<link rel="stylesheet" href="lib/assets/css/style.css" type="text/css">
	<link rel="stylesheet" href="lib/assets/css/font-awesome.min.css">
	<link rel="stylesheet" href="lib/assets/css/animate.css">
	<link rel="stylesheet" href="lib/assets/css/owl.carousel.css">
	<link rel="stylesheet" href="lib/assets/css/owl.theme.css">
	
	<!-- scripts -->
	<link rel="stylesheet" href="lib/assets/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script type="text/javascript" src="lib/assets/js/modernizr.custom.97074.js"></script>
	<div id="home-page">
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
                            <span class="sr-only">Student Assistant Tool</span>    
                        </div>
                        <!-- navbar logo -->

                    </div><!-- /.navbar-header -->

                    <!-- nav links -->
                    <div class="collapse navbar-collapse" id="main-nav-collapse">
                        <ul class="nav navbar-nav navbar-right text-uppercase">
                            <li>
                                <a href="portal-index.jsp"><span>home</span></a>
                            </li>
                              <li>
                             <%@ taglib prefix="c" 
           						uri="http://java.sun.com/jsp/jstl/core" %>
                              <a><span>Hello: <c:out value='${sessionScope["full_name"]}'/> </span></a>
                            </li>
                            <li>
                                <a href="sign-out.jsp"><span>Sign Out</span></a>
                            </li>
                            
                        </ul>
                    </div><!-- nav links -->
                    
                </div><!-- /.container -->
            </nav>
           </div>
        </head>
        <body>