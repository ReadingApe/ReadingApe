CKEDITOR.editorConfig = (config) ->
  config.toolbar_Mini = [
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList' ] },
    { name: 'insert',      items: [ 'Image','HorizontalRule','Smiley' ] },
    { name: 'links',       items: [ 'Link', 'Unlink' ] }
    { name: 'clipboard',   items: [ 'Undo','Redo' ] }
  ]
  config.toolbar = 'Mini'
  config.resize_dir = 'both'
  config.enterMode = CKEDITOR.ENTER_BR
  config.shiftEnterMode = CKEDITOR.ENTER_P
  true
