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
<p>&nbsp;</p>

<header id="header">
	<script>
	document.getElementById("header").style.backgroundImage = "url('lib/assets/img/QuizBG.png')";
	</script>
	
<body data-ng-app="MyApp">
	<div data-ng-controller="CardSetController">
	<div class="col-md-3">
	<%@ include file="portal-left-sidebar.jsp" %>
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
		
		<div class="col-md-6 sidenav text-center">
		<h2>Quiz Mode</h2>
		<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
			  <select ng-model="modes">
	          	<option value="frontfirst">Multiple Choice Front</option>
	          	<option value="backfirst">Multiple Choice Back</option>
	   		 </select>
	    	<div data-ng-show="modes == 'frontfirst'">
					<div data-ng-init="getQuizFlashCards();">
						<div class="paginationclass" data-ng-repeat="flash_card in flash_cards | pagination: curPage * pageSize | limitTo: pageSize">
							<div class="flip"> 
							 	<div class="card" style="background-color:transparent;"> 
			     					<div class="face front"> 
				            			{{flash_card.front}}
				            		</div>
			     				</div>
			     			</div>
			     			<div data-ng-if="flash_card.back == choice">
			     				<div data-ng-init="correctAnswers()"></div>
			     			</div>    			
			     		</div>			     		
		     		</div>
		     		<div class="col-md-12">
		     		<div data-ng-repeat="potential_answer in potential_answers">
			     		<input type="radio" data-ng-model="$parent.choice" name="choice" data-ng-value="potential_answer" required /> {{potential_answer}}
			     	</div>
			     	<p>&nbsp;</p>	
			     	</div>
	     		</div>
	     		
	     		<div class="pagination pagination-centered" ng-show="flash_cards.length">
					<ul class="pagination-controle pagination">
	 				
	 					<li>
	 						<span class="col-md-12">Question {{curPage + 1}} of {{flash_length}}</span>
	 					</li>
	 					<p>&nbsp;</p>
	 					<li>
	 					<div class="col-md-12">
						<button type="button" style="color:#FFF;" class="btn btn-slategray2"
	 						data-ng-disabled="!choice"
	 							ng-click="curPage = curPage+1; getFlashCardPotentialAnswers(flash_cards, curPage); choice = ''">SUBMIT QUESTION &gt;</button>
	 					</div>
	 					</li>
					</ul>
					<div data-ng-if="curPage == flash_cards.length">
						<div data-ng-init="resultPageRedirect('<%= currUser.getId() %>', card_set_id)"></div>
					</div>
				</div>
		</div>
		</div>
<% } else {
	response.sendRedirect("index.jsp");	
}%>