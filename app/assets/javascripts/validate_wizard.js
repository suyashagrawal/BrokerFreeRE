$(document).ready(function(){
  $( ".validate-wizard" ).validate({
    rules: {
      "location[zipcode]": {
        required: true,
        digits: true
      },
      "location[country]": {
        required: true
      },
      "seller[email]": {
        email: true,
      },
      "seller[contact]": {
        required: true,
        digits: true
      },
      "property[sq_feet_area]": {
        required: true,
        number: true
      },
      "property[full_bedrooms]": {
        required: true,
        digits: true
      },
      "property[full_baths]": {
        required: true,
        digits: true
      },
      "property[price]": {
        required: true,
        digits: true
      }
    }
  });
});