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
        a = data.states.map((value) => {
            return "<option value='"+value+"'>"+value+"</option>" 
          }).join();
        $('#location_state').empty()
        if(a !== ""){
          $('#location_state').append(a);
        }else{
          $('#location_state').append("<option>Invalid Option</option>" );
        }
      }
    });
  }
});
