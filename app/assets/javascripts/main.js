$(document).ready(function() {
  $('.toggler-wrap').click(function(){
    if ($(this).hasClass("activated")) {
      console.log("hey you hit me");
      $(this).children.fadeOut(500);
    }
    // // else if {}
    // //Expand or collapse this panel
    // $(this).next().slideToggle(300);
    // //Hide the other panels
    // $(".expander").not($(this).next()).slideUp(300);
  });
});
