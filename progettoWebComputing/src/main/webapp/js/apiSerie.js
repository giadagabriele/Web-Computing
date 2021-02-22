var apikey="AIzaSyCi_5yGn50JGvXgziORebOWIrpNiKDtFHE";

window.onload = function() {
	search= document.getElementById('id_titolo').innerHTML;
	regista= document.getElementById('regista').innerText;
	var maxResults= 1;
     q = 'https://www.googleapis.com/youtube/v3/search?key='+apikey
+'&type=video&part=snippet&maxResults='+ maxResults+'&q='
+search+" Trailer Season 1";

$.ajax({
      url: q, 
      dataType: "jsonp",
      success: function(data){
				 $('iframe').attr('src', 'https://www.youtube.com/embed/' + data.items[0].id.videoId)

      },
      error: function(jqXHR, textStatus, errorThrown) {
          alert (textStatus, + ' | ' + errorThrown);
      }
  });
  
};