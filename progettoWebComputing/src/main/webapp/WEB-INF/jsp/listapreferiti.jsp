<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>La tua lista</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../css/listapreferiti.css" type="text/css" />
	<script src="../js/eventi.js"></script>
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
	<h2>Lista Preferiti</h2>
		<div id="griglia" class="row text-center">
		<c:forEach var="titolo" items="${listTitoli}">
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<img src="images/${titolo}.jpg" alt="${titolo}" width="200" height="300">
				<h6 id="rimuovi"><a href="rimuoviDallaLista?titolo=${titolo}">Rimuovi</a></h6>
			</div>		
		</c:forEach>
		</div>
		<c:if test="${keyLogged == null}">
			<h5><a id="link" href="index.html">Accedi o Registrati per poter visualizzare la tua lista dei preferiti!</a></h5>
	  	 </c:if>
		
	
	<div id="footer" class="text-center">
			 <footer>
			<h6>Tutti i diritti riservati. <a href="chisiamo.html" id="link">Dev Team</a><div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="40" height="40"></div></h6> 
			</footer>
	</div>
</body>
</html> 