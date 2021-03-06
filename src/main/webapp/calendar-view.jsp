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
<%@ include file="script-link-tags.html" %>

<body id="calendar-body" data-ng-app="MyApp">
	
<div class="divcalendar">
	<div id="calendaroverallcontrols">
	  <input id ="userId" type="hidden" name="userId" value="<%= currUser.getId() %>">
	 
	  <div id="calendarmonthcontrols">
	    <a id="btnPrevYr" href="#" title="Previous Year"><span><<</span></a>
	    <a id="btnPrev" href="#" title="Previous Month"><span><</span></a>
	    	
	    <div id="monthandyear"></div>	
	
	    <a id="btnNext" href="#" title="Next Month"><span>></span></a>	
	    <a id="btnNextYr" href="#" title="Next Year"><span>>></span></a>      
	  </div>
	</div>
</div>
<div id="divcalendartable"></div>
	<div id="calendarEvent">
	
		<div id="popupContact">
	
			<form name="event" role="form" class="css-form" data-ng-controller="CalendarController">
				<hr>
				<div class="form-group">
		        	<input id="eventName" data-ng-model="event.name" class="form-control" placeholder="Event Name" type="text" required>
		        </div>
				<div class="form-group">
					<input id="eventTime" data-ng-model="event.time" class="form-control" placeholder="Start Time" type="text" required>
				</div>
				<div class="form-group">
					<textarea id="description" data-ng-model="event.message" class="form-control" placeholder="Description" required></textarea>
				</div>
				<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
				<button data-ng-click="addEvent(event)" class="btn btn-black">Submit</button>
			</form>
		</div>
	</div>
<%@ include file="portal-footer.html" %>
<% } %>