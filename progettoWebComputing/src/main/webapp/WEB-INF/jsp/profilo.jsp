<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Modifica Profilo</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.0.4/popper.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="../css/profilo.css" type="text/css" />
	<script src="../js/profilo.js"></script>
	
</head>
<body>
<div id="page_start" class="text-center">
  <img src="images/background.png" class="col-lg-4 col-md-8 col-sm-12">
 </div>
	<div class="container rounded bg-white mt-5">
    <div class="row">
        <div class="col-lg-4 col-md-4 col-sm-4 border-right">
            <div class="d-flex flex-column align-items-center text-center p-3 py-5">
				<input type="file" accept="image/*" onchange="loadFile(event)" id="path">
				<img id="output" src="${utente.profilo}" class="rounded-circle mt-5" width="100" height="100"/>
				<script>
				  var loadFile = function(event) {
				    var output = document.getElementById('output');
				    output.src = window.webkitURL.createObjectURL(event.target.files[0]);
				    output.onload = function() {
				     	URL.revokeObjectURL(output.src) // free memory
				    }
				  };
				</script>
	            <span class="font-weight-bold" id="nomeGoogle">${utente.nome} ${utente.cognome}</span>
	            <span class="text-black-50">${utente.email}</span>
            </div>
        </div>
        <c:if test="${google==false}">
        <div class="col-lg-8 col-md-8 col-sm-8">
            <div class="p-3 py-5">
                <div class="d-flex justify-content-between align-items-center mb-3">
                    <div class="d-flex flex-row align-items-center back"><i class="fa fa-long-arrow-left mr-1 mb-1"></i>
                        <h6><a id="link" href="index.html">Home</a></h6>
                    </div>
                </div>
                <div class="row mt-2">
                    <div class="col-lg-6 col-md-6 col-sm-6"><input type="text" class="form-control" placeholder="Nome" value="${utente.nome}" id="nome"></div>
                    <div class="col-lg-6 col-md-6 col-sm-6"><input type="text" class="form-control" value="${utente.cognome}" placeholder="Cognome" id="cognome"></div>
                </div>
                <div class="row mt-3">
                  	<div class="col-lg-6 col-md-6 col-sm-6"><input type="number" id="eta" class="form-control" value="${utente.eta}" placeholder="Età"></div>
                    <div class="col-lg-6 col-md-6 col-sm-6"><input type="password" id="pwd" class="form-control" value="${utente.password}" placeholder="Password">
                    <img id="occhio" src="images/occhio.png" onclick="showPwd()" width="25" height="15"/>
					<script>
					      function showPwd() {
					        var input = document.getElementById('pwd');
					        if (input.type === "password") {
					          input.type = "text";
					        } else {
					          input.type = "password";
					        }
					      }
					</script></div>
				</div>
                <div class="mt-5 text-right">
                	<button class="btn btn-primary profile-button" onclick="salvaProfilo();">Salva Profilo</button>
                </div>
            </div>
        </div>
        </c:if>
        <c:if test="${google==true}">
         <div>
         	<h6><a id="link" href="index.html">&ensp;Home&ensp;</a></h6><br>
         	&ensp;<button class="btn btn-primary profile-button" onclick="salvaProfiloGoogle();">Salva Profilo</button>
         </div>
        </c:if>
    </div>
</div>
<div class="text-center">
		 <footer>
			<h6>Tutti i diritti riservati. <a href="chisiamo.html" id="link">Dev Team</a><div class="navbar-brand"><img src="images/fox-logo.png" alt="logo" width="40" height="40"></div></h6> 
		</footer>
</div>
</body>
</html>
