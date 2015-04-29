/*
 * /bottles/new code
 */



$(function(){


  var bottleData = JSON.parse(sessionStorage.getItem('newBottle'));
  sessionStorage.clear();

  var hasPresetBottle = function() {
    return typeof(bottleData) !== 'undefined';
  }
  
  if(hasPresetBottle()) {
    // populate data in the form
    $("#bottle_name").val(bottleData.Name);
    $("#bottle_grape").val(bottleData.Varietal.Name);
    $("#bottle_winery").val(bottleData.Vineyard.Name);
    $("#bottle_label_image").val(bottleData.Labels[0].Url);
  }
  // console.log(bottleData);
  // $("form#new_bottle")

});


// $(document).ready(function(){
//   // alert("asdf");
//   // var expanderTrigger = document.getElementById('js-expander-trigger');
//   // var expanderContent = document.getElementById('js-expander-content');
//   $('#js-expander-trigger').click(function(){
//     $(this).toggleClass('expander-hidden');
//   });
// });
