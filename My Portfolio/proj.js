$(document).ready(function() {  
  $(window).scroll(function(){
    if($(this).scrollTop() > 20){
      $('.navbar') .addClass("sticky");
    }else{
      $('.navbar') .removeClass("sticky");
    }
    if($(this).scrollTop() > 500){
      $('.scroll-up-btn') .fadeIn("show");
    }else{
      $('.scroll-up-btn') .fadeOut("show");
    }
  });
 
  

  //slide up
  $('.scroll-up-btn').click(function(){
    $('html,body').animate({scrollTop:0},800);
    return false;
  });
  
  //toggle
  $('.menu-btn').click(function(){
    $('.navbar .menu').toggleClass("active");
    $('.menu-btn i').toggleClass("active");
  });
}); 