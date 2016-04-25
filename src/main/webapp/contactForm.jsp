<!DOCTYPE html>
<%@ include file="header.html" %>
<html>
<head>
<meta charset="UTF-8">
	<style type="text/css">
		body{font-family:verdana; font-size:12px}
		input[type=text], input[type=email], textarea{outline:none; 
		transition: .2s all linear; display:flex; border:1px solid silver;
		border-radius: 4px; padding:8px; -webkit-box-sizing: border-box;
		-moz-box-sizing:border-box; box-sizing: border-box; width:100%}
		input, textarea{margin:10px 0;}
		div#glob_content{background-color:#B8B8B8; 
						 border-radius:4px; 
						 boder:3px;
						 max-width:800px;
						 margin: o auto;}
		div#form_content{padding:30px;}
		div#title{background-color:#A0A0A0;
				  color:#F8F8F8; 
				  font-weight:bold; 
				  text-align: center;
				  text-tranform:uppercase;
				  text-shadow:1px 0px 15px #808080;
				  padding:20px;
				  font-size: 50px;}
    	

		textarea{height:300px;}
		input:focus; textarea:focus{border:2px solid #000000;}
	</style>
</head>

<body>
	<div id="glob_content">
		<div id="title">Contact Us</div>
		<div id="form_content">
			<form>
				<input type="text" name="name" placeholder="Name" />
				<input type="email" name="email" placeholder="Email" />
				<input type ="text" name="phone" placeholder="Phone" />
				<textarea name="message" placeholder="Message"></textarea>
				<button class="btn pricing-btn">Sent</button>
				<button class="btn pricing-btn">Cancel</button>
			</form>
		</div>
	</div>
</body>