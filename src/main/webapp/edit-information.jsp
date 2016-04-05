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
<script type="text/javascript" src="lib/assets/js/controllers/user-controller.js"></script>
<div class ="row">
	<div class="col-md-3">
		<%@ include file="portal-left-sidebar.jsp" %>
	</div>
<div ng-app="MyApp">
	<div data-ng-controller="UserController">
	<div class="col-md-6">
	
                 <div class="row">
						<form name="user" novalidate role="form">
	                     		<div class="col-md-6">
	                       			<div class="form-group">
	                             		<input type="text"  data-ng-model="name" class="form-control" placeholder="Name" id="name">
	                         		</div>
								
	                         		<div class="form-group">
	                             		<input type="email"  data-ng-model="email" class="form-control" placeholder="Email Address" id="email">
	                         		</div>
	                         
	                         		<div class="form-group">
										<input type="password" data-ng-model="password" class="form-control" placeholder="New Password" id="password">
									</div>
							
	                     		</div>
	                     		<div class="col-md-6">
	                         		<div class="form-group">
	                             		<input type="text" data-ng-model="affiliation" class="form-control" placeholder="School/Company" id="subject">
	                         		</div>
	                         
	                         		<div class="form-group">
	                      				<select data-ng-model="favorite_subject" class="form-control" id="favorite_subject">
											<option value="" disabled selected>Favorite Subject</option>
											<option>Math</option>
											<option>Computer Science</option>
											<option>Business</option>
											<option>Biology</option>
											<option>Art</option>
										</select>
	 					 			</div>
 	 					 				<button data-ng-click="editUser()" class="btn btn-black">Submit</button>
	                   				</div> 
               		 		</form>
               			</div>
                	</div>
                </div>
		</div>
	</div>
	<div class="col-md-3">
		<%@ include file="portal-right-sidebar.jsp" %>
	</div>
</div>
<%}
else{
	response.sendRedirect("index.jsp");
}%>
<%@ include file="portal-footer.html" %>
	
