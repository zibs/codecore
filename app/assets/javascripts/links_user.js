$(document).ready(function() {

  $("#basic_info_a").on("click", function(){
    console.log("clicked");
    $("#basic_info_form").toggle()
  })

  $(document).on("click","#education_edit_submit",function(){
    $(".edit_education").hide()
  })
});
