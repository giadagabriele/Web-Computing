window.addEventListener("load", function(){
	registraEventi();
});
function registraEventi(){
	var aggiungi= document.getElementById("aggiungiSerie");
	aggiungi.addEventListener("click",salvaSerie);
	var ok=document.getElementById("ok");
	ok.addEventListener("click",salvaPuntate);
}
function salvaSerie(){
	var pathimage=document.getElementById('name').files[0].name;
	var titolo= document.getElementById('titolo').value;
	var genere= document.getElementById('genere').value;
	var descrizione= document.getElementById('descrizione').value;
	var annoUscita= document.getElementById('annoUscita').value;
	var regista=document.getElementById('regista').value;
	var piattaforme=document.getElementById('piattaforme').value;
	var stagioni=document.getElementById('stagioni').value;
	$.ajax({
		url: "aggiungiSerie",
		method: "POST",
		data: {pathimage: pathimage, titolo: titolo,genere: genere,descrizione: descrizione,annoUscita: annoUscita, 
			   regista: regista, piattaforme: piattaforme, stagioni: stagioni},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}
function salvaPuntate(){
	var titolo= document.getElementById('titolo2').value;
	var stagione=document.getElementById('stagione').value;
	var durata= document.getElementById('durata').value;
	var puntate=document.getElementById('puntate').value;
	$.ajax({
		url: "aggiungiPuntate",
		method: "POST",
		data: {titolo: titolo,stagione: stagione,durata: durata,puntate: puntate},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
	
}