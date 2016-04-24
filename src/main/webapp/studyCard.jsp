
 <title>Study page</title>
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
<div class="col-md-3">
	<%@ include file="portal-left-sidebar.jsp" %>
</div>
<body ng-app="CardSetControllers">
<div data-ng-controller="CardSetController">
		<div class="col-md-6 sidenav text-center">
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
				<button title="Add to QuickLinks" data-ng-click='addToQuicklink("<%= currUser.getId() %>","Flash Card Study")'  type="submit"> 
					<img src="lib/assets/img/logo3.png" height="35">
				</button>
				<h3>{{q_link_status}}</h3>
			<h2>Study Mode</h2>
			<br>
		
		<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
		  <select ng-model="modes">
          	<option value="frontfirst">FRONT FIRST</option>
          	<option value="backfirst">BACK FIRST</option>
          	<option value="randomfront">RANDOM FRONTS FIRST</option>
          	<option value="randomback">RANDOM BACKS FIRST</option>
   		 </select>
    
			<div data-ng-show="modes == 'frontfirst'">
				<div data-ng-init="getFlashCards()">
					<div class="paginationclass" data-ng-repeat="flash_card in flash_cards | pagination: curPage * pageSize | limitTo: pageSize">
						<div class="flip"> 
						 	<div class="card" style="background-color:transparent;"data-ng-class="{'flipped':isFlipped}" data-ng-click="isFlipped=!isFlipped"> 
		     					<div class="face front"> 
			            			{{flash_card.front}}
			            		</div> 
			            		<div class="face back"> 
			                		{{flash_card.back}}
			            		</div> 
		     				</div>
		     			</div>
		     		</div>	
	     		</div>
     		</div>
     		<div data-ng-show="modes == 'backfirst'">
				<div data-ng-init="getFlashCards()">
					<div class="paginationclass" data-ng-repeat="flash_card in flash_cards | pagination: curPage * pageSize | limitTo: pageSize">
						<div class="flip"> 
						 	<div class="card" style="background-color:transparent;"data-ng-class="{'flipped':isFlipped}" data-ng-click="isFlipped=!isFlipped"> 
		     					<div class="face front"> 
			            			{{flash_card.back}}
			            		</div> 
			            		<div class="face back"> 
			                		{{flash_card.front}}
			            		</div> 
		     				</div>
		     			</div>
		     		</div>	
	     		</div>
     		</div>
     		<div data-ng-show="modes == 'randomfront'">
				<div data-ng-init="getRandomCards()">
					<div class="paginationclass" data-ng-repeat="random_flash_card in random_flash_cards | pagination: curPage * pageSize | limitTo: pageSize">
						<div class="flip"> 
						 	<div class="card" style="background-color:transparent;"data-ng-class="{'flipped':isFlipped}" data-ng-click="isFlipped=!isFlipped"> 
		     					<div class="face front"> 
			            			{{random_flash_card.front}}
			            		</div> 
			            		<div class="face back"> 
			                		{{random_flash_card.back}}
			            		</div> 
		     				</div>
		     			</div>
		     		</div>	
	     		</div>
     		</div>
     		<div data-ng-show="modes == 'randomback'">
				<div data-ng-init="getRandomCards()">
					<div class="paginationclass" data-ng-repeat="random_flash_card in random_flash_cards | pagination: curPage * pageSize | limitTo: pageSize">
						<div class="flip"> 
						 	<div class="card" style="background-color:transparent;"data-ng-class="{'flipped':isFlipped}" data-ng-click="isFlipped=!isFlipped"> 
		     					<div class="face front"> 
			            			{{random_flash_card.back}}
			            		</div> 
			            		<div class="face back"> 
			                		{{random_flash_card.front}}
			            		</div> 
		     				</div>
		     			</div>
		     		</div>	
	     		</div>
     		</div>
    		<div class="pagination pagination-centered" ng-show="flash_cards.length">
				<ul class="pagination-controle pagination">
					
 					<li>
  						<button type="button" style="color:#FFF;" class="btn btn-slategray2" ng-disabled="curPage == 0"
 							data-ng-click="curPage=curPage-1"> &lt; PREV</button>
 					</li>
 					<li>
 						<span class="col-md-12">Page {{curPage + 1}} of {{flash_length}}</span>
 					</li>
 					<li>
						<button type="button" style="color:#FFF;" class="btn btn-slategray2"
 						data-ng-disabled="curPage >= flash_cards.length/pageSize - 1"
 							ng-click="curPage = curPage+1">NEXT &gt;</button>
 					</li>
 					
				</ul>
			</div>
    </div>

    
			
		</div>
	
<% } else {
	response.sendRedirect("index.jsp");	
}%>
<%@ include file="portal-footer.html" %>