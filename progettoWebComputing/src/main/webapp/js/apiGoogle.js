function onSignIn(googleUser) {
  var profile = googleUser.getBasicProfile();
  $("#signin-container").hide();
  $("#loggedUserImage").attr("src", profile.getImageUrl());
  $("#loggedUsername").html(profile.getName());
  $("#loggedUserEmail").html(profile.getEmail());
  //console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
  console.log('Name: ' + profile.getName());
  console.log('Image URL: ' + profile.getImageUrl());
  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
  $.ajax({
		url: "faiIscrizioneGoogle",
		method: "POST",
		data: {nome: profile.getName(), email: profile.getEmail()},
		success: function(response){
			$.ajax({
				url: "loginGoogle",
				method: "POST",
				data: {email: profile.getEmail()},
				success: function(response){
					location.reload();
				},
				fail: function( jqXHR, textStatus ) {
		  			alert( "Request failed: " + textStatus );
				}
			});
		},
		fail: function( jqXHR, textStatus ) {
			alert( "Request failed: " + textStatus );
		}
  });
}
function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
}

function signOut() {
	var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () {
      console.log('User signed out.');
    });
	$.ajax({
		url: "logout",
		method: "POST",
		success: function(response){
		},
		fail: function( jqXHR, textStatus ) {
  			alert( "Request failed: " + textStatus );
		}
	});
}

