$(document).ready ->
  $(window).scroll ->
    if $(this).scrollTop() > $('body > nav.navbar').outerHeight(true) * 2.718
      $('body > nav.navbar').fadeOut 500
    else
      $('body > nav.navbar').fadeIn 500
