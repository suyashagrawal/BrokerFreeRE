$(document).ready(function(){
  $("#upload_trigger").click(function(){
    $("#file_upload").click();
  });

  $("#file_upload").on("change", function(){
    var numFiles = $(this).get(0).files.length
    if (numFiles > 1)
      $('.image-upload-div').html(numFiles + " files selected")
    else
      $('.image-upload-div').html(numFiles + " file selected")
  });
})
