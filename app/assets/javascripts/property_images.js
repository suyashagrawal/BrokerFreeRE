$(document).ready(function(){
  $('.other-images').on('click', function(){
    $("#main-image").attr('src', this.src.replace("small_", ""));
  });
});  