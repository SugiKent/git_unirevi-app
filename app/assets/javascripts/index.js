// スライダーのjquery
$(document).on("turbolinks:load", function() {
        $('.slick').slick( {
          dots: true,
          autoplay:true,
        　centerMode: true,
        　centerPadding: '10%',
        });
    });

// タブメニューの jquery
function  tab_menu_button() {
  
  function tab_menu() { 
    $("li").removeClass("selected");
    $(this).addClass("selected")
    $(".contets_list .one").hide()
    $(".contets_list .two").hide()
    $(".contets_list .three").hide()
    $(".contets_list .four").hide()
    $(".contets_list .five").hide()
     $(".contets_list .six").hide()
    $("." + this.id).show()
}
  
  $("li").on("click", tab_menu);
}
window.addEventListener("turbolinks:load",tab_menu_button);