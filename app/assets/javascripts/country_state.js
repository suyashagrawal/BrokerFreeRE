$(document).ready(function(){
  if ($('.country option:selected').text() != 'Select Country'){
    getStates();
  }

  $('.country').change(function(){
    getStates();
  });

  function getStates(){
    $.ajax({
      url: '/states',
      type: "GET",
      data: {country_name: $('.country option:selected').text()},
      success: function(data) {
        autocomplete_state(data.states);
      }
    });
  };

  function autocomplete_state(states) {
    $("#location_state").autocomplete({
      source: states
    });
  }
});

