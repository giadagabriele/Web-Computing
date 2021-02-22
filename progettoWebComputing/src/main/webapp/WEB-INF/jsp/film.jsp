<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>L'Archivio delle Volpi</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="../css/film.css" type="text/css" />
	<script src="../js/eventi.js"></script>
	<script src="../js/api.js"></script>
</head>
<body>
<div class="text-center">
 <img src="images/background.png"  class="col-lg-4 col-md-8 col-sm-12">
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
	<h2 id="id_titolo">${film.titolo}</h2>
	<section class="row col-lg-8 col-md-8 col-sm-8">
		<div>
			<img src="images/${film.pathImage}" alt="${film.titolo}" width="200" height="300" id="immagine">
		</div>
		<div id="descrizione">
			<h6><b>Genere:</b> ${film.genere}</h6>
			<h6 id="line"><b>Regista:</b> <h6 id="regista">${film.regista}</h6></h6>
			<h6><b>Anno:</b> ${film.dataUscita}</h6>
			<h6><b>Durata:</b> ${film.durata} min</h6>
			<h6><b>Disponibile su:</b> ${film.piattaforme}</h6> 
			<c:choose>
		    	<c:when test="${id=='admin'}">
				  	<h6><a href="rimuoviDalCatalogoFilm?titolo=${film.titolo}" id="aggiungi">Rimuovi Film</a></h6>
			  	</c:when>
			  	<c:otherwise>
				<c:if test="${keyLogged != null}">
				 	<c:if test="${presente==false}">
						<h6><a onClick="aggiungiAllaLista();" href="" id="aggiungi">Aggiungi alla Lista</a></h6>
					</c:if>
				</c:if>
				<c:if test="${keyLogged == null}"> 
					<br><h6><a id="link" href="index.html">Accedi o Registrati per creare la tua Lista Preferiti!</a></h6>
				</c:if>
				</c:otherwise>
	  		</c:choose>
		</div>
	</section>
	<h4><b>Trama</b></h4>
	<p id="trama">${film.descrizione}</p>
   
   <iframe id="iframe" width="400" height="300" ></iframe>
   
    <c:if test="${keyLogged != null}"> 
    <c:choose>
		<c:when test="${id!='admin'}">
		    <div id="rec" class="container mr-auto align-items-center">
			    <h6><b>Aggiungi recensione</b></h6> 
			    <div class="card p-3 col-lg-8 col-md-8 col-sm-8">
			        <div class="rating">
					    <span id="stella1" onClick="inviaStella(this.id);" class="fa fa-star"></span>
				      	<span id="stella2" onClick="inviaStella(this.id);" class="fa fa-star"></span>
				       	<span id="stella3" onClick="inviaStella(this.id);" class="fa fa-star"></span>
				        <span id="stella4" onClick="inviaStella(this.id);" class="fa fa-star"></span>
				        <span id="stella5" onClick="inviaStella(this.id);" class="fa fa-star"></span>
					</div><br>
			        <textarea id="textarea" maxlength="1000" class="form-control"> </textarea>
			        <div class="mt-3 justify-content-between align-items-center"> <span id="count"></span> <button id="invia" onclick="inviaRecensione();" class="btn btn-sm btn-danger">Invia</button> </div>
		    	</div>
			</div>
		</c:when>
	</c:choose>
	</c:if>
	<c:if test="${keyLogged == null}"> 
		<p><a id="link" href="index.html">Accedi o Registrati per poter inserire una tua recensione!</a></p>
	</c:if>
 <section class="row">
  <form>
    <div id="box" class="form-group col-lg-12 col-md-12 col-sm-12">
      <label for="comment"><h5 id="testo_rec"><b>Recensioni</b></h5></label>
	      	<c:forEach var="rec" items="${listRecensioni}">
	      		<div>
	      			<c:if test="${rec.stelle == 1}"> 
	      				 <span class="fa fa-star checked"></span>
	      			</c:if>
	      			<c:if test="${rec.stelle == 2}"> 
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      			</c:if>
	      			<c:if test="${rec.stelle == 3}"> 
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      			</c:if>
	      			<c:if test="${rec.stelle == 4}"> 
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      			</c:if>
	      			<c:if test="${rec.stelle == 5}"> 
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      				 <span class="fa fa-star checked"></span>
	      			</c:if>
	      		
	      			<c:forEach var="u" items="${listUtentiRecensioni}">
		      			<c:if test="${u.email==rec.utente}">
			      			<h6><img src="${u.profilo}" class="rounded-circle" width="40" height="40">&ensp;<b id="nomeRec">${rec.utente}:</b> ${rec.testo}&ensp;
			      			 	<c:if test="${u.email==id}">
			      			 		<a href="rimuoviRece?utente=${rec.utente}&testo=${rec.testo}&titolo=${film.titolo}"><i class="fa fa-trash" aria-hidden="true"></i></a>
			      			 	</c:if>
			      			</h6>
		      			</c:if>
	      			</c:forEach>
	      			<br>
	      		</div> 
	      	</c:forEach>
	      	
    </div>
  </form>
 </section>
 
	
	<div class="text-center">
			 <footer>
			<h6>Tutti i diritti riservati. <a href="chisiamo.html" id="link">Dev Team</a><div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="40" height="40"></div></h6> 
			</footer>
	</div>
</body>
</html>