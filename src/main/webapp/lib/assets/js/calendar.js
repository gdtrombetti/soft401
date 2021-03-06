
var Calendar = function(o) {	
 
  this.divId = o.ParentID;
  this.user_id = o.user_id;
  this.DaysOfWeek = o.DaysOfWeek;
  this.Months = o.Months;
  var d = new Date();
  this.events = getEvents(o.user_id);
  this.CurrentMonth = d.getMonth();
  this.CurrentYear = d.getFullYear();
  var f = o.Format;
  //this.f = typeof(f) == 'string' ? f.charAt(0).toUpperCase() : 'M';
  if(typeof(f) == 'string') {
    this.f  = f.charAt(0).toUpperCase();
  } else {
    this.f = 'M';
  }
};

function getEvents (user_id){
	var events;
	$.ajax({
		type: "GET",
		url: "GetEventServlet",
		async: false,
		data: { user_id: user_id },
		success : function ( data ) {
			events = data;
		}
	});
	return events;
};
// Goes to next month
Calendar.prototype.nextMonth = function() {
  if ( this.CurrentMonth == 11 ) {
    this.CurrentMonth = 0;
    this.CurrentYear = this.CurrentYear + 1;
  } else {
	  this.CurrentMonth = this.CurrentMonth + 1;
  }
  this.showCurrent();
};

// Goes to previous month
Calendar.prototype.previousMonth = function() {
  if ( this.CurrentMonth == 0 ) {
    this.CurrentMonth = 11;
    this.CurrentYear = this.CurrentYear - 1;
  } else {
    this.CurrentMonth = this.CurrentMonth - 1;
  }
  this.showCurrent();
};

// 
Calendar.prototype.previousYear = function() {
  this.CurrentYear = this.CurrentYear - 1;
  this.showCurrent();
}

// 
Calendar.prototype.nextYear = function() {
  this.CurrentYear = this.CurrentYear + 1;
  this.showCurrent();
}              

// Show current month
Calendar.prototype.showCurrent = function() {
  this.Calendar(this.CurrentYear, this.CurrentMonth);
};

// Show month (year, month)
Calendar.prototype.Calendar = function(y,m) {
  events = this.events;
  var event;

  typeof(y) == 'number' ? this.CurrentYear = y : null;
  typeof(y) == 'number' ? this.CurrentMonth = m : null;
  // 1st day of the selected month
  var firstDayOfCurrentMonth = new Date(y, m, 1).getDay();
  // Last date of the selected month
  var lastDateOfCurrentMonth = new Date(y, m+1, 0).getDate();
  // Last day of the previous month
  var lastDateOfLastMonth = m == 0 ? new Date(y-1, 11, 0).getDate() : new Date(y, m, 0).getDate();
  var monthandyearhtml = '<span id="month">' + this.Months[m] + '</span> - ' + '<span id="year">' + y + '</span>';
  var html = '<table data-ng-controller="CalendarController">';
  
  // Write the header of the days of the week
  html += '<tr>';
  for(var i=0; i < 7;i++) {
    html += '<th class="daysheader">' + this.DaysOfWeek[i] + '</th>';
  }
  html += '</tr>';
  //this.f = 'X';
  var p = dm = this.f == 'M' ? 1 : firstDayOfCurrentMonth == 0 ? -5 : 2;
  var cellvalue; 
	    for (var d, i=0, z0=0; z0<6; z0++) {
	    	html += '<tr>';
	    	
	    	for (var z0a = 0; z0a < 7; z0a++) {
	    		d = i + dm - firstDayOfCurrentMonth;
	    		// Dates from prev month
	    		
	    		if (d < 1){	
	    			cellvalue = lastDateOfLastMonth - firstDayOfCurrentMonth + p++;
	    			html += '<td id="prevmonthdates">' + 
	    			'<span id="cellvaluespan">' + (cellvalue) + '</span><br/></td>';
     
	    		} else if ( d > lastDateOfCurrentMonth){
	    			html += '<td id="nextmonthdates">' + (p++) + '</td>';
      
	    		} else {
	    			html += '<td id="currentmonthdates" onClick="show_event(\'' + d + '\')">' + (d) + '</td>';
	    				p = 1;
	    		}
	    			 			
	    		
	    		
      if (i % 7 == 6 && d >= lastDateOfCurrentMonth) {
        z0 = 10; // no more rows
      }
      i++;          
    }
    html += '</tr>';
  }
  // Closes table
  html += '</table>';
  html +='</div>'
  // Write HTML to the div
  //document.getElementById("year").innerHTML = yearhtml;

  //document.getElementById("month").innerHTML = monthhtml;
  document.getElementById("monthandyear").innerHTML = monthandyearhtml;
  document.getElementById(this.divId).innerHTML = html;
};

// On Load of the window
window.onload = function() {
  
  // Start calendar
  var c = new Calendar({
    ParentID:"divcalendartable",
    user_id : document.getElementById('userId').value,
    DaysOfWeek:[
    'MON',
    'TUE',
    'WED',
    'THU',
    'FRI',
    'SAT',
    'SUN'
    ],

    Months:['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ],

    Format:'dd/mm/yyyy'
  });

  c.showCurrent();
  
  // Bind next and previous button clicks
  getId('btnPrev').onclick = function(){
    c.previousMonth();
  };

  getId('btnPrevYr').onclick = function(){
    c.previousYear();
  };

  getId('btnNext').onclick = function(){
    c.nextMonth();
  };

  getId('btnNextYr').onclick = function(){
	  c.nextYear();
  };
}


function show_event (d) {
  var lightbox = document.getElementById("calendarEvent");
  
  var month = $("#month").text();
  var year = $("#year").text();
  var scope = angular.element(document.getElementById("currentmonthdates")).scope();
  console.log(scope);
  scope.$apply(function () {
	 scope.$$childHead.getDateData(d, month, year);
});
  dimmer = document.createElement("div");
  dimmer.style.width =  window.innerWidth + 'px';
  dimmer.style.height = 1200 + 'px';
  dimmer.className = 'dimmer';
  dimmer.onclick = function(){
      document.body.removeChild(this);   
      lightbox.style.visibility = 'hidden';
  }
  document.body.appendChild(dimmer);
  lightbox.style.visibility = 'visible';
  lightbox.style.top = window.innerHeight/2 - 50 + 'px';
  lightbox.style.left = window.innerWidth/2 - 100 + 'px';
  document.getElementById('calendarEvent').style.visibility = "visible";
return false;
}

// Get element by id
function getId(id) {
  return document.getElementById(id);
}