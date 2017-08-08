$(document).ready(function(){
  $("#upload_trigger").click(function(){
    $("#file_upload").click();
  });

  $("#file_upload").on("change", function(){
    var numFiles = $('.image-preview img').length + $(this).get(0).files.length;

    if (numFiles > 1) {
      $('.image-upload-div').html(numFiles + " files selected")
    }
    else {
      $('.image-upload-div').html(numFiles + " file selected")
    }

    loadFile($(this));
  });

  var loadFile = function(event) {
    var str = '';
    $.each(event.get(0).files, function( index, value ) {
      str += '<img src="' + URL.createObjectURL(value) + '"width="50" height="50" alt="Uploaded Image" title="Uploaded Image" />'
    });

    $('.image-preview').append(str);
  };
})
