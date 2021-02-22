window.addEventListener("load", function(){
	registraEventi();
});
function registraEventi(){
	var aggiungi= document.getElementById("aggiungiFilm");
	aggiungi.addEventListener("click",salvaFilm);
}
function salvaFilm(){
	var pathimage=document.getElementById('name').files[0].name;
	var titolo= document.getElementById('titolo').value;
	var genere= document.getElementById('genere').value;
	var descrizione= document.getElementById('descrizione').value;
	var annoUscita= document.getElementById('annoUscita').value;
	var durata= document.getElementById('durata').value;
	var regista=document.getElementById('regista').value;
	var piattaforme=document.getElementById('piattaforme').value;
	$.ajax({
		url: "aggiungiFilm",
		method: "POST",
		data: {pathimage: pathimage, titolo: titolo,genere: genere,descrizione: descrizione,annoUscita: annoUscita, 
			   durata: durata, regista: regista, piattaforme: piattaforme},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}