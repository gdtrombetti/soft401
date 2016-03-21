
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Quize page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Set height of the grid so .sidenav can be 100% (adjust if needed) */
    .row.content {height: 500}
    
    /* Set gray background color and 100% height */
    .sidenav {
      background-color: #f2f2f2;
      height: 500px;
    }
		.rightcolor{
			background-color:#e6e6e6;
			height:500px;

		}
	
	/* set light blue background color*/
	header{
		background-color:#bfbfbf;
		padding:15px;
	}


    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: auto;
      }
      .row.content {height: auto;} 
    }
	.mybox {
    background-color: white;
    width: 500px;
	height:300px;
    padding: 25px;
    border: 1px solid grey;
    margin: auto;
}
  </style>
</head>
<body>
	<header class="container-fluid">
		<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>                        
		</button>
		<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education"></a>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a href="#"><span class="glyphicon glyphicon-home "></span>Home</a></li>
				<li><a href="#">Projects</a></li>
				<li><a href="#"><span class="glyphicon glyphicon-phone-alt "></span>Contact</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#"><span class="glyphicon glyphicon-user "></span>Welcome User</a></li>
				<li><a href="#">Signout</a></li>
			</ul>
		</div>
 	</header>
	<div class="container-fluid">
	<div class="row content">
		<div class="col-sm-9 sidenav text-center">
			<h3>Quize Mode</h3>
			<br>
			<div class="mybox">some text</div>
      		<h4> 1 of 12</h4>
			<ul class="pager">
				<li><a href="#"><span class="glyphicon glyphicon-step-backward "></span>Previous</a></li>
				<li><a href="#">Flip<span class="glyphicon glyphicon-repeat "></span></a></li>
				<li><a href="#">Next<span class="glyphicon glyphicon-step-forward "></span></a></li>
			</ul>
		</div>

		<div class="col-sm-3 rightcolor">
			<div class="tab-widget">
				<h4><span class="glyphicon glyphicon-cog">Flashcard Tools</h4>
				<div class="nav-tabs-default">
					<div class="tab-content">
						<div class="popular-post">
							<h5 class="post-widget-heading"></h5>
							<ul class="list-group">
								<li class="list-group-item"><a href="#">Quize Mode <span class="glyphicon glyphicon-question-sign "></span></li></a>
								<li class="list-group-item"><a href="#">Edit Card <span class="glyphicon glyphicon-edit "></span></li></a>
								<li class="list-group-item"><a href="#">Shuffle <span class="glyphicon glyphicon-random "></span></li></a>
								<li class="list-group-item"><a href="#">Extra Partice<span class="glyphicon glyphicon-star "></span></li></a>
								<li class="list-group-item"><a href="#">Delete Card<span class="glyphicon glyphicon-trash"></span></li></a>
							</ul>
						</div>
					</div>
				</div>
			</div>    
		</div>
	</div>
	</div>
</body>
</html>
