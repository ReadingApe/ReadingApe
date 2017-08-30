//= require ckeditor-jquery

$(document).on "turbolinks:load", ->

  $(".ckeditor:not(:has(+ .cke))").ckeditor()

  true
