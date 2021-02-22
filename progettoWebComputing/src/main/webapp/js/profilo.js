function salvaProfilo(){
	if(document.getElementById('path').files[0]!=null){
		var path=document.getElementById('path').files[0].name;
		var newPath = "profilo/"+path;
	}
	else{
		var newPath = document.getElementById('output').getAttribute('src');
	}
	var nome= document.getElementById('nome').value;
	var cognome= document.getElementById('cognome').value;
	var anni= document.getElementById('eta').value;
	var password= document.getElementById('pwd').value;
	$.ajax({
		url: "aggiornaProfilo",
		method: "POST",
		data: {nomeUtente: nome,cognomeUtente:cognome,pathUtente:newPath, eta:anni, pwd:password},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}
function salvaProfiloGoogle(){
	if(document.getElementById('path').files[0]!=null){
		var path=document.getElementById('path').files[0].name;
		var newPath = "profilo/"+path;
	}
	else{
		var newPath = document.getElementById('output').getAttribute('src');
	}
	var nome=document.getElementById('nomeGoogle').innerHTML;
	$.ajax({
		url: "aggiornaProfiloGoogle",
		method: "POST",
		data: {nomeUtente:nome,pathUtente:newPath},
		success: function(response){
			alert(response);
			location.reload();
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}