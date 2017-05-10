if (typeof(CKEDITOR) != 'undefined') {
  CKEDITOR.editorConfig = function( config )
  {
   config.toolbar = 'Basic';
   config.toolbar_Basic =
   [
     ['Source', 'NumberedList', 'BulletedList', 'Link', 'Unlink', 'Image', 'JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','Indent','Outdent', 'Table','HorizontalRule','SpecialChar', 'Iframe'],
     ['Styles','Format','Font','FontSize', 'TextColor','BGColor', 'Bold', 'Italic', 'Underline', 'Strike','Subscript','Superscript']
   ];
 
   config.enterMode = CKEDITOR.ENTER_BR;
   config.shiftEnterMode = CKEDITOR.ENTER_BR;
   config.autoParagraph = false;
  }
}