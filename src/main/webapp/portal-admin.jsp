<%@ include file="portal-header.html" %>
<div class ="row">
	<div class="col-md-3">
		<%@ include file="script-link-tags.html" %>
		<div class="tab-widget">
   			<h4>Portal Navigation</h4>
   			<div class="nav-tabs-default">
       			<div class="tab-content">
	         		<div class="popular-post">
	           		<h5 class="post-widget-heading">Quick Links</h5>
	           			<ul class="list-group">
		           		<li class="list-group-item"><a href="#">Computer Science Flash Cards</li></a>
		           		<li class="list-group-item"><a href="#"> Hospitality Flash Cards</li></a>
		           		<li class="list-group-item"><a href="#"> Sign-Out</li></a>
	           			</ul>
	           		<h5 class="post-widget-heading">Tools</h5>
	           			<ul class="list-group">
		           		<li class="list-group-item"><a href="#">Flash Card Sets</li></a>
		           		<li class="list-group-item"><a href="#">Calendar</li></a>
		           		<li class="list-group-item"><a href="#">Create Group</li></a>
		           		<li class="list-group-item"><a href="#">Manage Groups</li></a>
	           			</ul>
	         		</div>
	     		</div>
       		</div>
		</div>
	</div>
	<div class="col-md-6">
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h1 class="panel-title">Welcome, User</h1>
					</div>		
				<div class="panel-body">
					<div class="portal-container">
						<h2 class="panel-title">Recent Sets</h2>
					</div>
				</div>
				</div>
			</div>	
			<div class="col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">
						<div class="panel-title">Date/Time</div>
					</div>
					<div class="panel-body">
						<div class="portal-container">
							<h2 class="panel-title">Notifications</h2>
						</div>
					</div>
				</div>
			</div>
	
	
	
	
</div>
		<div class="col-md-3">
			<%@ include file="portal-right-sidebar.jsp" %>
		</div>
<div class="col-md-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">Statistics</div>
		</div>
			<div class="panel-body">
				<div class="portal-container">This is where the individualized stats will be located</div>
			</div>	
		
	</div>
</div>
<div class="col-md-6">
	<div class="panel panel-default">
		<div class="panel-heading">
			<div class="panel-title">Group Statistics</div>
		</div>
		<div class="panel-body">
			<div class="portal-container">This is where the stats of administered groups
			will be located</div>		
		</div>
	</div>
</div>

		
</div>

