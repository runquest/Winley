// Display Wine bottles leverages wine.com api search function

$(function(){
  // when the form is submitted

  // grab the keyword from the input field

  // perform ajax search

  function getWineInfo(query) {
    var req = new XMLHttpRequest();
    var link = "http://services.wine.com/api/beta2/service.svc/JSON/catalog?search="+ query +"&apikey=b1af7f1d65f1e1ebdb2faf060ad8fadd"

    req.onreadystatechange = function() {
      console.log('state changed', req.readyState, req.status);
      if (req.readyState == 4 && req.status == 200) {

        console.log('received success response', req.responseText);
        var data = JSON.parse(req.responseText);

        $('.bottle').empty();

        for (i = 0; data.Products.List.length; i++) {
          var imgSrc;
          var bottleData = data.Products.List[i];
          if(bottleData && bottleData.Labels && bottleData.Labels.length > 0) {
            imgSrc = bottleData.Labels[0].Url;
          } else {
            imgSrc = "";
          }

          // Check out handlebars or jade as an alternative to 
          var bottlecard = $('<div class="bottlecard">')
            .append($('<div class="bottle-card-image">').append(
                $('<img>').attr('src', imgSrc)
              ))
            .append(
              $('<div class="bottle-card-header">').text(bottleData.Name))
              .append($('<button>').text("+"))
              .append(
                $('<div class="bottle-card-copy">').text(('Price: $' + bottleData.PriceRetail)).css('weight', 'bold')
              )
          // Attach bottle data to the DOM element
          bottlecard.data('bottle', bottleData);
          $('.bottle').append(bottlecard);
        } // end for
      } // end if
    }
    req.open("GET", link, true);
    req.send();
  }


  $("form.search").on('submit', function(e){
    e.preventDefault(); // don't submit the form
    var query = $(this.search).val();
    getWineInfo(query);
  });

  // Set up a delegate listener that will be called after bottles are loaded to the DOM
  $('.search-bottle').on('click', '.bottlecard button', function(){
    // grab the data for this bottle
    var bottleData = $(this).parent('.bottlecard').data('bottle');
    // serialize the bottle data into session
    sessionStorage.setItem('newBottle', JSON.stringify(bottleData));
    // redirect to /bottles/new
    window.location = '/bottles/new'
  });


});
