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
    User currUser = (User)(session.getAttribute("currentSessionUser"));
    if(session.getAttribute("currentSessionUser") != null)
    {
    	
    %>
<%@ include file="portal-header.jsp" %>
<body data-ng-app="MyApp">
	<div data-ng-controller="CardSetController">
	<div class="col-md-3">
		<div class="tab-widget">
		   <h4>Portal Navigation</h4>
	  		 <div class="nav-tabs-default">
	      		 <div class="tab-content">
		         <div class="popular-post">
		           <h5 class="post-widget-heading">Quick Links</h5>
		            <div data-ng-init="getQuickLinks('<%= currUser.getId() %>')">
			           <div data-ng-if="link_length == 0">
			           	<ul class="list-group">
				           	<li class="list-group-item">{{no_q_links}}</li>
			          	</ul>
			           </div>
			           <div data-ng-repeat="link in q_links">
			           		<ul class="list-group">
				           		<li class="list-group-item"><a href={{link.link}}>{{link.title}}</a><img data-ng-click="removeQuickLink($index,'<%= currUser.getId() %>', link.link)" src="lib/assets/img/trash.png" /></li>
			          		 </ul>
			           </div>
		           </div>
		           <h5 class="post-widget-heading">Tools</h5>
		           <ul class="list-group">
			           	<li class="list-group-item"><a href="view-sets.jsp">Flash Card Sets</li></a>
			           	<li class="list-group-item"><a href="calendar.jsp">Calendar</li></a>
						<br />
		           </ul>
		         </div>
		     </div>
	       </div>
	  </div>
	</div>
		<script>
			function getURLParameter(sParam) {
				var sPageURL = window.location.search.substring(1);
				var sURLVariables = sPageURL.split('&');
			
				for (var i = 0; i < sURLVariables.length; i++) {
					var sParameterName = sURLVariables[i].split('=');
					if (sParameterName[0] == sParam) {
						return sParameterName[1];
					}
				}
			}
				function getUrl() {
				return window.location.href;
				}
		</script>
	<div class="col-md-6">
		<div data-ng-init="getQuizResults()"></div>
		 You scored a {{correct}} out of {{total}} which is {{percent_correct}}%
	</div>
</div>
	<% } else {
	response.sendRedirect("index.jsp");	
}%>