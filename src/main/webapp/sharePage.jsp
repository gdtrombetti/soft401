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

<div class ="row">
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
	<div class="col-md-6">
			<div class="col-md-6">
				<form name="share" novalidate role="form" class="css-form" data-ng-app="MyApp" data-ng-controller="CardSetController">
	            	<div class="form-group">
              			<input type="email"  data-ng-model="search_email" class="form-control" placeholder="Email Address" id="email" required>
	            	</div>
	            	<button data-ng-click="shareCardSet()" class="btn btn-black">Share</button>
	        	</form>          
			</div>	
	</div>
		
		
	</div>
</div>
		
</div>
</header>
<%}
else{
	response.sendRedirect("index.jsp");
}%>
<%@ include file="portal-footer.html" %>
	
