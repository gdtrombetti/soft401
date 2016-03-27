<%@ include file="portal-header.jsp" %>

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
		<a href="view-sets.jsp" class="btn btn-slategray"> Add Card Set </a>
	</div>
	
<%@ include file="portal-footer.html" %>

       

	

 
 
