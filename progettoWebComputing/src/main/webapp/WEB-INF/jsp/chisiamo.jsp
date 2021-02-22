<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dev Team</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../css/chisiamo.css" type="text/css" />
</head>
<body>
<div id="page_start" class="text-center">
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
    	<c:choose>
	    	<c:when test="${id=='admin'}">
		    	<li class="nav-item dropdown">
			      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			        Aggiungi Contenuto
			      </a>
			      <div class="dropdown-menu">
			        <a class="dropdown-item" href="aggiungiFilm.html">Film</a>
			        <a class="dropdown-item" href="aggiungiSerie.html">Serie Tv</a>
			      </div>
			    </li>
		  	</c:when>
		  	<c:otherwise>
		    	<li class="nav-item">
			  		<a class="nav-link" href="listapreferiti.html">La mia lista</a>
			  	</li>
	  		</c:otherwise>
	  	</c:choose>
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

<section id="team" class="pb-5">
    <div class="container">
    	
        <div class="row">
        
            <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="image-flip" >
                    <div class="mainflip flip-0">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="team/Giada.png" alt="card image"></p>
                                    <h4 class="card-title">Giada Gabriele</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-6">
                                    <h4 class="card-title">Giada Gabriele</h4>
                                    <p class="card-text">Front-end Developer <br> &emsp; Studentessa di Informatica all'Università della Calabria &emsp;</p>
                                    <ul class="list-inline">
                                       <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://github.com/GiadaGabriele">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="team/Carolina.jpg" alt="card image"></p>
                                    <h4 class="card-title">Carolina Iulianello</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-6">
                                    <h4 class="card-title">Carolina Iulianello</h4>
                                    <p class="card-text">Front-end Developer <br> &emsp; Studentessa di Informatica all'Università della Calabria &emsp;</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://github.com/CaroIulianello">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="team/Ons.jpg" alt="card image"></p>
                                    <h4 class="card-title">Ons Sabri</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-6">
                                    <h4 class="card-title">Ons Sabri</h4>
                                    <p class="card-text">Back-end Developer <br> &emsp; Studentessa di Informatica all'Università della Calabria &emsp;</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://github.com/OnsSabri">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-sm-6 col-md-6 col-lg-6">
                <div class="image-flip" ontouchstart="this.classList.toggle('hover');">
                    <div class="mainflip">
                        <div class="frontside">
                            <div class="card">
                                <div class="card-body text-center">
                                    <p><img class=" img-fluid" src="team/Luana.jpg" alt="card image"></p>
                                    <h4 class="card-title">Luana Tassone</h4>
                                </div>
                            </div>
                        </div>
                        <div class="backside">
                            <div class="card">
                                <div class="card-body text-center mt-6">
                                    <h4 class="card-title">Luana Tassone</h4>
                                    <p class="card-text"> Back-end Developer <br> &emsp; Studentessa di Informatica all'Università della Calabria &emsp;</p>
                                    <ul class="list-inline">
                                        <li class="list-inline-item">
                                            <a class="social-icon text-xs-center" target="_blank" href="https://github.com/lulutax">
                                                <i class="fa fa-github"></i>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        
        </div>
    </div>
</section>
</body>
</html>