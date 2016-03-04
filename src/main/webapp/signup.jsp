<%@ include file="header.html" %>

<script src="lib/assets/js/controllers/user-controller.js"></script>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-sm-6">
	    	<div class="price-box">
	        	<h3>Basic</h3>
	             <div class="price-info">
	             	<span>Personal Schedule</span>
	             	<span>Add/Delete/Edit Flash Cards</span>
	             	<span>Multiple Study Modes</span>
	             	<span>Chat/Share with Friends</span>
	             	<p class="price"><span>Free</span></p>
	             </div> <!-- /.price-info -->
	             <a id="basic_signup_button"  class="btn pricing-btn">Get Started</a>
	         </div> <!-- /.price-box -->
	     </div>
     	<div class="col-md-6 col-sm-6">
        	<div class="price-box">
        		<h3>Administrator</h3>
             <div class="price-info">
				<span>Personal Schedule</span>
   				<span>Add/Delete/Edit Flash Cards</span>
   				<span>Multiple Study Modes</span>
   				<span>Create Groups to Share, Assist, and Communicate with</span>
   				<p class="price"><span>Free</span></p>
             </div> <!-- /.price-info -->
             <a id="admin_signup_button" class="btn pricing-btn">Get Started</a>
         	</div> <!-- /.price-box -->
     	</div>
	  </div>
  	<div class="col-md-6 col-sm-6">
  		<div class="basic_form">
                 <div class="row">
						<form name="user" novalidate role="form" class="css-form" data-ng-controller="UserController">
	                     		<div class="col-md-6">
	                       			<div class="form-group">
	                             		<input type="text"  data-ng-model="user.name" class="form-control" placeholder="Name" id="name" required>
	                         		</div>
								
	                         		<div class="form-group">
	                             		<input type="email"  data-ng-model="user.email" class="form-control" placeholder="Email Address" id="email" required>
	                         		</div>
	                         
	                         		<div class="form-group">
										<input type="password" data-ng-model="user.password" class="form-control" placeholder="Password" id="password" required>
									</div>
							
									<div class="form-group">
	        							<input type="password" data-ng-model="user.confirm_password" class="form-control" placeholder="Confirm Password" id="confirm_password" required>
	        						</div>
	                     		</div>
	                     		<div class="col-md-6">
	                         		<div class="form-group">
	                             		<input type="text" data-ng-model="user.affiliation" class="form-control" placeholder="School/Company" id="subject" required>
	                         		</div>
	                         
	                         		<div class="form-group">
	                      				<select data-ng-model="user.favorite_subject" class="form-control" id="favorite_subject" required>
											<option value="" disabled selected>Favorite Subject</option>
											<option>Math</option>
											<option>Computer Science</option>
											<option>Business</option>
											<option>Biology</option>
											<option>Art</option>
										</select>
	 					 			</div>
	 					 			<input type="hidden" name="type" data-ng-init="type=1;" data-ng-value="type"/>
 +	 					 				<button data-ng-click="AddUser(user)"  class="btn btn-black">Submit</button>
	                   				</div> 
               		 		</form>
               			</div>
                	</div>
  				</div>
  	<div class="col-md-6 col-sm-6">
  		<div class="admin_form">
                 <div class="row">
                     <div class="col-md-6">
						<form method="post">
	                        <div class="form-group">
	                             <input name="name" type="text" class="form-control" id="name" required="required" placeholder="Full Name">
	                         </div>
	
	                         <div class="form-group">
	                             <input name="email" type="email" class="form-control" id="email" required="required" placeholder="Email Address">
	                         </div>
	                         <div class="form-group">
								<input type="password" class="form-control" placeholder="Password" id="password" required>
							</div>
							<div class="form-group">
	        					<input type="password" class="form-control" placeholder="Confirm Password" id="confirm_password" required>
	        				</div>
	                     </div>
	                     <div class="col-md-6">
	                         <div class="form-group">
	                             <input name="affiliation" type="url" class="form-control" id="subject" required="required" placeholder="School/Company">
	                         </div>
	                         <div class="form-group">
	                      		<select name="fav-subject" class="form-control" id="fav-subjec">
									<option value="" disabled selected>Favorite Subject</option>
									<option>Math</option>
									<option>Computer Science</option>
									<option>Business</option>
									<option>Biology</option>
									<option>Art</option>
								</select>
	 					 	</div>
	 					 <button type="submit" id="submit" name="submit" class="btn btn-black">SIGN UP!</button>
	                   </div> 
               		 </form>
                </div>
  			</div>
  		</div>
  	</div>
  <script type="text/javascript" src="lib/assets/js/script.js"></script>
<%@ include file="footer.html" %>