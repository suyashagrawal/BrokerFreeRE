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
        window.data = data.states
        autocomplete_state(data.states);
      }
    });
  };

  function autocomplete_state(states) {
    $("#location_state").autocomplete({
      source: states
    });
  }
  $("#location_state").change(function(event){
  if (data.indexOf($(this).val()) == -1)
    $(this).val("")
  });
});

