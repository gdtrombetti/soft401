<%@ include file="script-link-tags.html" %>
<body ng-app="CalendarControllers">
	<div class="divcalendar">
	<div id="calendaroverallcontrols">
	  <!-- <div id="year"></div> -->
	  <div id="calendarmonthcontrols">
	    <a id="btnPrevYr" href="#" title="Previous Year"><span><<</span></a>
	    <a id="btnPrev" href="#" title="Previous Month"><span><</span></a>
	    <!-- <input type="button" src="images/btnprevmonth.png" alt="Submit" id="btnPrev"/>-->
	    <!-- <div id="month"></div>-->	
	    <div id="monthandyear"></div>	
	    <!--<input type="button" src="images/btnnextmonth.png" alt="Submit" id="btnNext"/>-->	
	    <a id="btnNext" href="#" title="Next Month"><span>></span></a>	
	    <a id="btnNextYr" href="#" title="Next Year"><span>>></span></a>      
	  </div>
	</div>
</div>
<div id="divcalendartable"></div>
	<div id="calendarEvent">
	<!-- Popup Div Starts Here -->
		<div id="popupContact">
		<!-- Contact Us Form -->
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
				<button data-ng-click="addEvent(event)" class="btn btn-black">Submit</button>
			</form>
		</div>
	</div>
<%@ include file="portal-footer.html" %>