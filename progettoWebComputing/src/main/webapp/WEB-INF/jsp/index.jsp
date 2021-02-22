<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="google-signin-client_id" content="816049827530-lharhd7asn8r5ekmtau3epue70td0c04.apps.googleusercontent.com">
<title>L'Archivio delle Volpi</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../css/index.css" type="text/css" />
	<script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
	<script src="../js/apiGoogle.js"></script>
</head>
<body>

<div id="page_start" class="text-center">
  <img src="images/background.png" class="col-lg-4 col-md-8 col-sm-12">
  <h6 id="login"> 
	  <c:if test="${keyLogged == null}"> 
			<button  type="button" class="btn btn-light" id="link" href="" data-toggle="modal" data-target="#formAccedi">Accedi</button>
			<button  type="button" id="signin-container" class="g-signin2 btn" data-onsuccess="onSignIn"></button>
			<br> o <a id="link" href="registrazione.html">Registrati</a>
	  </c:if>
	  <c:if test="${keyLogged != null}"> 
		Ciao <a href="profilo.html" id="link">${keyLogged}</a> !
		<div><a id="link" href="" onclick="signOut();">Logout</a></div>
	  </c:if>
  </h6>
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

	
<div id="demo" class="carousel slide col-lg-12 col-md-12 col-sm-12" data-ride="carousel">

  <!-- Indicators -->
  <ul class="carousel-indicators">
    <li data-target="#demo" data-slide-to="0" class="active"></li>
    <li data-target="#demo" data-slide-to="1"></li>
    <li data-target="#demo" data-slide-to="2"></li>
    <li data-target="#demo" data-slide-to="3"></li>
    <li data-target="#demo" data-slide-to="4"></li>
  </ul>
  
  <!-- The slideshow -->
  <div class="carousel-inner">
  	<div class="carousel-item active">
      <img src="images/carousel-gomorra.jpg" alt="Gomorra" width="1600" height="450" class="col-lg-12 col-md-12 col-sm-12">
    </div>
  	<div class="carousel-item">
      <img src="images/carousel-soul.jpg" alt="Soul" width="1600" height="450" class="col-lg-12 col-md-12 col-sm-12">
    </div>
    <div class="carousel-item">
      <img src="images/carousel-chuck.jpg" alt="Chuck" width="1600" height="450" class="col-lg-12 col-md-12 col-sm-12">
    </div>
    <div class="carousel-item">
      <img src="images/carousel-mindhunter.jpg" alt="Mindhunter" width="1600" height="450" class="col-lg-12 col-md-12 col-sm-12">
    </div>
    <div class="carousel-item">
      <img src="images/carousel-vikings.jpg" alt="Vikings" width="1600" height="450" class="col-lg-12 col-md-12 col-sm-12">
    </div>
  </div>
  
  <!-- Left and right controls -->
  <a class="carousel-control-prev" href="#demo" data-slide="prev">
    <span class="carousel-control-prev-icon"></span>
  </a>
  <a class="carousel-control-next" href="#demo" data-slide="next">
    <span class="carousel-control-next-icon"></span>
  </a>
</div>
	
  <div class="pagination-container">
   <div data-page="1" >
      <div id="griglia" class="row text-center">
		<c:forEach var="film" items="${listUnoFilm}" >
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="film.html?titolo=${film.titolo}"><img src="images/${film.pathImage}" alt="${film.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
		<c:forEach var="serie" items="${listUnoSerie}">
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="serietv.html?titolo=${serie.titolo}"><img src="images/${serie.pathImage}" alt="${serie.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
	</div>
   </div>
   <div data-page="2" style="display:none;">
      <div id="griglia" class="row text-center">
		<c:forEach var="film" items="${listDueFilm}" >
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="film.html?titolo=${film.titolo}"><img src="images/${film.pathImage}" alt="${film.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
		<c:forEach var="serie" items="${listDueSerie}">
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="serietv.html?titolo=${serie.titolo}"><img src="images/${serie.pathImage}" alt="${serie.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
	</div>
   </div>
   <div data-page="3" style="display:none;">
       <div id="griglia" class="row text-center">
		<c:forEach var="film" items="${listTreFilm}" >
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="film.html?titolo=${film.titolo}"><img src="images/${film.pathImage}" alt="${film.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
		<c:forEach var="serie" items="${listTreSerie}">
		  	<div class="col-lg-2 col-md-4 col-sm-4" id="griglia">
				<a href="serietv.html?titolo=${serie.titolo}"><img src="images/${serie.pathImage}" alt="${serie.titolo}" width="200" height="300"></a>
			</div>
		</c:forEach>
	</div>
   </div>
	
	<div class="pagination">
	  <ul class="pagination">
		  <li data-page="-" class="page-item"><a class="page-link bg-custom-1" href="#">Previous</a></li>
		  <li data-page="1" class="page-item"><a class="page-link bg-custom-1" href="#">1</a></li>
		  <li data-page="2" class="page-item"><a class="page-link bg-custom-1" href="#">2</a></li>
		  <li data-page="3" class="page-item"><a class="page-link bg-custom-1" href="#">3</a></li>
		  <li data-page="+" class="page-item"><a class="page-link bg-custom-1" href="#">Next</a></li>
	</ul>
	</div></div>
   <script>
var paginationHandler = function(){
    // store pagination container so we only select it once
    var $paginationContainer = $(".pagination-container"),
        $pagination = $paginationContainer.find('.pagination ul');
    // click event
    $pagination.find("li a").on('click.pageChange',function(e){
        e.preventDefault();
        // get parent li's data-page attribute and current page
    var parentLiPage = $(this).parent('li').data("page"),
    currentPage = parseInt( $(".pagination-container div[data-page]:visible").data('page') ),
    numPages = $paginationContainer.find("div[data-page]").length;
    // make sure they aren't clicking the current page
    if ( parseInt(parentLiPage) !== parseInt(currentPage) ) {
    // hide the current page
    $paginationContainer.find("div[data-page]:visible").hide();
    if ( parentLiPage === '+' ) {
                // next page
        $paginationContainer.find("div[data-page="+( currentPage+1>numPages ? numPages : currentPage+1 )+"]").show();
    } else if ( parentLiPage === '-' ) {
                // previous page
        $paginationContainer.find("div[data-page="+( currentPage-1<1 ? 1 : currentPage-1 )+"]").show();
    } else {
        // specific page
        $paginationContainer.find("div[data-page="+parseInt(parentLiPage)+"]").show();
            }
        }
    });
};
$( document ).ready( paginationHandler );
</script>
		
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
	<div class="text-center">
		 <footer>
			<h6>Tutti i diritti riservati. <a href="chisiamo.html" id="link">Dev Team</a><div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="40" height="40"></div></h6> 
		</footer>
</div>
	
</body>
</html>