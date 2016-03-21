
<html lang="en">
<head>
  <title>createdcard page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <style>
    /* Remove the navbar's default margin-bottom and rounded borders */ 
    .navbar {
      margin-bottom: 0;
      border-radius: 0;
    }
    
    /* Set height of the grid so .sidenav can be 100% (adjust as needed) */
    .row.content {height: 1500}
    
    /* Set gray background color and 100% height */
    .sidenav {
      padding-top: 20px;
      background-color: #f1f1f1;
      height: 100%;
    }
    

    
    /* On small screens, set height to 'auto' for sidenav and grid */
    @media screen and (max-width: 767px) {
      .sidenav {
        height: auto;
        padding: 15px;
      }
      .row.content {height:auto;} 
    }
  </style>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#"><span class="glyphicon glyphicon-home "></span>Home</a></li>
        <li><a href="#">Projects</a></li>
        <li><a href="#"><span class="glyphicon glyphicon-earphone "></span>Contact</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-log-in "></span>Signout</a></li>
        <li><a href="#">Welcome User</a></li>
        
      </ul>
    </div>
  </div>
</nav>
  
<div class="container-fluid text-left">    
  <div class="row content">
    <div class="sidenav">
    <div class="col-md-3"> 
      <h1>Create New Card set</h1>
      						<h2>Description</h2>
          		          <li>
             	           	<label for="title" class="required">
               	            <h3>Set Title</h3>  
                           	</label>
                    	  </li>
								<input type="text" name="subject" id="subject" value="" maxlength="100" class="txt greybg valid-string-length as">   						
                    	  <li>
                        	<label for="subject" class="optional">
                            	<h3>Subjects</h3>
						    </label>
                    	  </li>
								<input type="text" name="subject" id="subject" value="" maxlength="100" class="txt greybg valid-string-length as">
						  <li>  
							<label for="access" class="required">
								<h3>Access</h3>
							</label>
								<div class="select2-container as access-select select2-dropdown-open
							 select2-container-active select2-drop-above" id="s2id_access">
								<select name=access" id="acces" class="as select2-offscreen" 
								tabindex="-1" title= "Access">
								<option value="public" label="Public" >Public</option>
								<option value="private" label="Private">Private</option>
								</select>
								</div>
						  </li>
						<br>
						<%@ include file="addbutton.jsp" %>
						<br>
						<%@ include file="flashcard.jsp" %>	
						<br>		       		        
					</div>
			<br><br><br> 
				<div class= "col-md-3">
            	  <li id="descriptionBox">
                		<label for="description">
               		     	<h3 >Description<span>(Optional)</span></h3>
						</label>
            	  </li>
					<textarea name="description" id="description" maxlength="2000"cols="100" rows="15"></textarea>   
				</div>
			</div>
<div class="sidenav">
  	<div class="row">
		<div class="col-md-6 col-md-offset-6">
             <h1 font-size:25>Finish &amp; Create</h1>
             </div>
        <div class="col-md-6 col-md-offset-6">
			<button class="button">Create Set</button>
			<button class="button">Cancle</button>
		</div>
	</div>
</div>
		
		</div>
 </div>
</body>
</html>


       

	

 
 
