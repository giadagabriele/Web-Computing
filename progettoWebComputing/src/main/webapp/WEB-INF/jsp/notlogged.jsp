<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="google-signin-client_id" content="816049827530-lharhd7asn8r5ekmtau3epue70td0c04.apps.googleusercontent.com">
<title>404</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<script src="../js/apiGoogle.js"></script>
	<link rel="stylesheet" href="../css/notfound.css" type="text/css" />
</head>
<body>
<div class="text-center">
  <img src="images/background.png" class="col-lg-4 col-md-8 col-sm-12">
 </div>
	<div class="sticky-top">
		<nav class="navbar navbar-expand-sm bg-custom-2 navbar-dark">
		 <div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="50" height="50"></div>
		  <ul class="navbar-nav col-lg-8 col-md-8 col-sm-8">
		  	<li class="nav-item">
		  		<a class="nav-link" href="index.html">Home</a>
		  	<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        Genere Film
		      </a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item" href="genere.html?genere=Anime">Anime</a>
				<a class="dropdown-item" href="genere.html?genere=Azione">Azione</a>
				<a class="dropdown-item" href="genere.html?genere=Bambini e Famiglie">Bambini e Famiglie</a>
				<a class="dropdown-item" href="genere.html?genere=Commedie">Commedie</a>
				<a class="dropdown-item" href="genere.html?genere=Crime">Crime</a>
				<a class="dropdown-item" href="genere.html?genere=Documetari">Documentari</a>
				<a class="dropdown-item" href="genere.html?genere=Drammi">Drammi</a>
				<a class="dropdown-item" href="genere.html?genere=Fantascienza e Fantasy">Fantascienza e Fantasy</a>
				<a class="dropdown-item" href="genere.html?genere=Horror">Horror</a>
				<a class="dropdown-item" href="genere.html?genere=Italiani">Italiani</a>
				<a class="dropdown-item" href="genere.html?genere=Musical">Musical</a>
				<a class="dropdown-item" href="genere.html?genere=Natale">Natale</a>
				<a class="dropdown-item" href="genere.html?genere=Premiati">Premiati</a>
				<a class="dropdown-item" href="genere.html?genere=Romantici">Romantici</a>
				<a class="dropdown-item" href="genere.html?genere=Thriller">Thriller</a>
		      </div>
	    	</li>
	    	<li class="nav-item dropdown">
		      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
		        Genere Serie TV
		      </a>
		      <div class="dropdown-menu">
		        <a class="dropdown-item" href="genereSerie.html?genere=Adolescenziale">Adolescenziale</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Anime">Anime</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Azione">Azione</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Bambini">Bambini</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Commedie">Commedie</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Crime">Crime</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Docuserie">Docuserie</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Drammi">Drammi</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Fantascienza e Fantasy">Fantascienza e Fantasy</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Horror">Horror</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Italiani">Italiani</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Natale">Natale</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Romantici">Romantici</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Scienza e natura">Scienza e natura</a>
				<a class="dropdown-item" href="genereSerie.html?genere=Thriller">Thriller</a>
		      </div>
	    	</li>
	    	<li class="nav-item">
		  		<a class="nav-link" href="listapreferiti.html">La mia lista</a>
		  	</li>
		  	</ul>
		  	<ul class="navbar-nav ml-auto">
		    <li>
			    <form class="form-inline" method="POST" action="cerca">
			    <input name="titolo" class="form-control mr-sm-2" type="text" placeholder="Cerca">
			    <input src="images/search.png" type="image" width="30" height="30"/>
			  	</form>	  	
		  	</li>
		  </ul>
		</nav>
	</div>
	<div class="text-center">
	<h2>Login Failed</h2>		  	
			<h5>Email o Password errati. Effettua di nuovo l'accesso.</h5>
			<h6 id="login"> 
				<button  type="button" class="btn btn-light" id="link" href="" data-toggle="modal" data-target="#formAccedi">Accedi</button>
 			 </h6>
	</div>
		
	<div class="modal" id="formAccedi" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
		 <form method="POST" action="login">
		    <div class="modal-content">
		      <div class="modal-header text-center">
		        <h4 class="modal-title">Accedi</h4>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">          
		        </button>
		      </div>
		      <div class="modal-body mx-3">
		        <div class="md-form mb-5">          
		          <input type="text" id="form3" class="form-control" name="email">
		          <label  for="form3">Email</label>
		        </div>
		
		         <div class="md-form mb-4">          
		          <input type="password" id="form2" class="form-control" name="password" >
		          <label for="form2">Password</label>
		           <img src="images/occhio.png" onclick="showPwd()" width="25" height="15"/> 
					<script>
					      function showPwd() {
					        var input = document.getElementById('form2');
					        if (input.type === "password") {
					          input.type = "text";
					        } else {
					          input.type = "password";
					        }
					      }
					</script>
		        </div>
		
		      </div>
		      <div class="modal-footer justify-content-center">
		        <input type="submit" class="btn btn-success" value="Accedi">
		      </div>
		       <div class="modal-footer">
        
        		<button type="button" class="btn btn-danger" data-dismiss="modal">Chiudi</button>
      		</div>
		    </div>
	    </form>
	  </div>
	  </div>
	<div id="footer" class="text-center">
			 <footer>
			<h6>Tutti i diritti riservati. <a href="chisiamo.html" id="link">Dev Team</a><div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="40" height="40"></div></h6> 
			</footer>
	</div>
</body>
</html>