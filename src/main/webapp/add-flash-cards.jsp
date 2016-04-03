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
    <body ng-app="CardSetControllers" data-ng-controller="CardSetController">
		
		<div class ="row">
			<div class="col-md-3">
				<%@ include file="portal-left-sidebar.jsp" %>
			</div>

			<div class="col-md-9">
				<form name="addCard" novalidate role="form" class="css-form" >
        			<table id="card-content" class="">
                		<thead>
                    		<tr>
                    				<th colspan="0">
                            			<h3>FRONT</h3>
                            				<div class="form-group">
    											<textarea id="text" cols="31" rows="5" my-maxlength="5" data-ng-model="front"></textarea>
    										</div>
                         			</th>	
                        			
										<th colspan="0">
                            				<h3>BACK</h3> 
												<div class="form-group">
			 										<textarea id="text" cols="31" rows="5" my-maxlength="5" data-ng-model="back">
			 										</textarea>
			 									</div>
										</th>
									
								
							</tr>
						</thead>					       
					</table>
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
					</script>	
					<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
						
	                	<div data-ng-if="flash_card_status != undefined">
	                		<h2>{{flash_card_status}}</h2>
	                	</div>
	                	</form>
	                	
							<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
							<div data-ng-init="getFlashCards()">
							<div class="col-md-11">
							<button data-ng-click="addFlashCard()" class="btn btn-block" style="background-color: #9999FF; color: #000000">Add Card</button>
							</div>
						    <p>&nbsp;</p>
						    <p>&nbsp;</p>
      							<div class="col-md-6">
      							
      								<h4>FRONT</h4>
      								<div ng-repeat="flash_card in flash_cards">
  									
  										<div class="card card-block" style="background-color:#FFFFF; border-color: #9999FF; border-width: 2px; height: 100px; width: 300px;">
											<p align="center" class="card-text">{{flash_card.front}}</p>
  										</div>	
  									
      							</div>
      							</div>
      							<div class="col-md-3">
      								<h4>BACK</h4>
      									<div ng-repeat="flash_card in flash_cards">
  										<div class="card card-block" style="background-color:#FFFFF; border-color: #9999FF; border-width: 2px; height: 100px; width: 300px;">
											<p align="center" class="card-text">{{flash_card.back}}</p>
  										</div>	
  									</div>
      							</div>
  							</div>
					</div>
      			</div>
		

	


<% } else {
	response.sendRedirect("index.jsp");	
}%>
<%@ include file="portal-footer.html" %>