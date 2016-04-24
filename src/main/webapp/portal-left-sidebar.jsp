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
    User user3 = (User)(session.getAttribute("currentSessionUser"));
    %>
<%@ include file="script-link-tags.html" %>
<body  ng-app="MyApp">
 <div data-ng-controller="CardSetController">
	<div class="tab-widget">
	   <h4>Portal Navigation</h4>
	   <div class="nav-tabs-default">
	       <div class="tab-content">
		         <div class="popular-post">
		           <h5 class="post-widget-heading">Quick Links</h5>
		            <div data-ng-init="getQuickLinks('<%= user3.getId() %>')">
			           <div data-ng-if="link_length == 0">
			           	<ul class="list-group">
				           	<li class="list-group-item">{{no_q_links}}</li>
			          	</ul>
			           </div>
			           <div data-ng-repeat="link in q_links">
			           		<ul class="list-group">
				           		<li class="list-group-item"><a href={{link.link}}>{{link.title}}</a><img data-ng-click="removeQuickLink($index,'<%= user3.getId() %>', link.link)" src="lib/assets/img/trash.png" /></li>
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
