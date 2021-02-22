var nStelle=0;

function mostraInfo(stagione){ 
	var st= stagione.options[stagione.selectedIndex].value;
	var idTitolo = document.getElementById('id_titolo').innerHTML;
	$.ajax({
		url: "visualizzaInfo",
		method: "POST",
		data: {titolo: idTitolo,stagione:st},
		success: function(response){
			document.getElementById('episodi').innerHTML= "<b>Numero episodi: "+ response.puntate+"</b>";
			document.getElementById('durata').innerHTML= "<b>Durata episodio: "+ response.durata+"</b>";			
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
	
}

function aggiungiAllaLista(){
	var idTitolo = document.getElementById('id_titolo').innerHTML;
	$.ajax({
		url: "aggiunto",
		method: "POST",
		data: {titolo: idTitolo},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}
function inviaRecensione(){
	var idTitolo = document.getElementById('id_titolo').innerHTML;
	var idTesto=document.getElementById('textarea').value;
	$.ajax({
		url: "inviata",
		method: "POST",
		data: {stelle: nStelle, titolo: idTitolo, testo: idTesto},
		success: function(response){
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}

function inviaStella(stella){
	if(stella=="stella1"){
		document.getElementById('stella1').className='fa fa-star checked'; 
		document.getElementById('stella2').className='fa fa-star';
		document.getElementById('stella3').className='fa fa-star'; 
		document.getElementById('stella4').className='fa fa-star';
		document.getElementById('stella5').className='fa fa-star'; 
		nStelle=1;
	}
	if(stella=="stella2"){
		document.getElementById('stella1').className='fa fa-star checked'; 
		document.getElementById('stella2').className='fa fa-star checked'; 
		document.getElementById('stella3').className='fa fa-star'; 
		document.getElementById('stella4').className='fa fa-star';
		document.getElementById('stella5').className='fa fa-star'; 
		nStelle=2;
	}
	if(stella=="stella3"){
		document.getElementById('stella1').className='fa fa-star checked'; 
		document.getElementById('stella2').className='fa fa-star checked';
		document.getElementById('stella3').className='fa fa-star checked'; 
		document.getElementById('stella4').className='fa fa-star';
		document.getElementById('stella5').className='fa fa-star'; 
		nStelle=3;
	}
	if(stella=="stella4"){
		document.getElementById('stella1').className='fa fa-star checked'; 
		document.getElementById('stella2').className='fa fa-star checked';
		document.getElementById('stella3').className='fa fa-star checked'; 
		document.getElementById('stella4').className='fa fa-star checked'; 
		document.getElementById('stella5').className='fa fa-star';
		nStelle=4;
	}
	if(stella=="stella5"){
		document.getElementById('stella1').className='fa fa-star checked'; 
		document.getElementById('stella2').className='fa fa-star checked';
		document.getElementById('stella3').className='fa fa-star checked'; 
		document.getElementById('stella4').className='fa fa-star checked';
		document.getElementById('stella5').className='fa fa-star checked'; 
		nStelle=5;
	}
}