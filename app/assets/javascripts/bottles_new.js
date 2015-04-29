/*
 * /bottles/new code
 */

$(function(){
  var bottleData = JSON.parse(sessionStorage.getItem('newBottle'));

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
  console.log(bottleData);
  // $("form#new_bottle")
});
