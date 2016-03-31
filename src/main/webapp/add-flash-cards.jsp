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
		<div class="container">
		<div class ="row">
			<div class="col-md-3">
				<%@ include file="portal-left-sidebar.jsp" %>
			</div>

			<div class="col-md-6">
				<form name="addCard" novalidate role="form" class="css-form" >
        			<table id="card-content" class="">
                		<thead>
                    		<tr>
                    			<div class="row">
                    				<div class="col-md-2">
                        				<th colspan="0">
                            			<h3>Front</h3>
                            				<div class="form-group">
    											<textarea id="text" cols="40" rows="5" my-maxlength="5" data-ng-model="front"></textarea>
    										</div>
                         				</div>
                        			<div class="col-md-4">
										<th colspan="0">
                            				<h3>Back</h3> 
												<div class="form-group">
			 										<textarea id="text" cols="40" rows="5" my-maxlength="5" data-ng-model="back">
			 										</textarea>
			 									</div>
										</th>
									</div>
								</div>
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
						<button data-ng-click="addFlashCard()" class="btn btn-white-ish-lol">Add Card</button>
	                	<div data-ng-if="flash_card_status != undefined">
	                		<h2>{{flash_card_status}}</h2>
	                	</div>
	                	</form>
	                	<div class="col-md-12">
							<input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
							<div data-ng-init="getFlashCards()">
      							<div class="col-md-6">
      								<h4>FRONT</h4>
      							</div>
      							<div class="col-md-6">
      								<h4>BACK</h4>
      							</div>
      							<div ng-repeat="flash_card in flash_cards">
  									<div class="col-md-6">
  										<div class="card card-block" style="background-color:#FFFFF; border-color: #0275d8; border-width: 1px;">
											<p class="card-text">{{flash_card.front}}</p>
  										</div>	
  									</div>
  									<div class="col-md-6">
  										<div class="card card-block" style="background-color:#FFFFF; border-color: #0275d8; border-width: 1px;">
											<p class="card-text">{{flash_card.back}}</p>
  										</div>	
  									</div>
  								</div>
  							</div>
						</div>
					</div>
      			</div>
			</div>
		<div>
	</div>

	<div class="row">
	
	</div>
</div>

<% } else {
	response.sendRedirect("index.jsp");	
}%>
<%@ include file="portal-footer.html" %>