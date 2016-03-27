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
<body ng-app="CardSetControllers">
<div class="container">
	<div class="row">
    <div class="col-md-3"> 
      	<h2 class="section-title">New Card Set</h2>
        <label for="title" class="required">
        Set Title</label>
		<input type="text" name="subject" id="subject" value="" maxlength="100" class="txt greybg valid-string-length as">   						
		<label for="subject" class="optional">Subjects </label>
			<input type="text" name="subject" id="subject" value="" maxlength="100" class="txt greybg valid-string-length as">
	</div>
		<div class= "col-md-3">
        	<div id="descriptionBox">
			<label for="description">
				Description<span>(Optional)</span></label>
            	  </div>
			<textarea name="description" id="description" maxlength="2000"cols="100" rows="15"></textarea>   
		</div>
		</div>
	
        	<form name="card_set" novalidate role="form" data-ng-controller="CardSetController">
	       	<div class="form-group">
	         	<input type="title"  data-ng-model="card_set.title" class="form-control" placeholder="Title" id="title" required>
	         </div>
             <div class="form-group">
				<input type="subject" data-ng-model="card_set.subject" class="form-control" placeholder="Subject" id="subject" required>
			</div>
			<div class="form-group">
			 <label for="text">Textarea label</label>:
    <textarea id="text" cols="40" rows="5" my-maxlength="5" data-ng-model="card_set.description"></textarea>
    </div>
    <input type="hidden" name="" data-ng-init="userId=<%= currUser.getId() %>" data-ng-value="type"/>
			<button data-ng-click="AddSet(card_set)" class="btn btn-white-ish-lol">Add Card Set</button>

		</form>

	</div>
	<% } else {
		response.sendRedirect("index.jsp");
	}%>
<%@ include file="portal-footer.html" %>	


       

	

 
 
