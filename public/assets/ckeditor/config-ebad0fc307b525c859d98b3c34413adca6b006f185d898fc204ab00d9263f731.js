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
   
        /* Filebrowser routes */
  // The location of an external file browser, that should be launched when "Browse Server" button is pressed.
  config.filebrowserBrowseUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Flash dialog.
  config.filebrowserFlashBrowseUrl = "/ckeditor/attachment_files";

  // The location of a script that handles file uploads in the Flash dialog.
  config.filebrowserFlashUploadUrl = "/ckeditor/attachment_files";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Link tab of Image dialog.
  config.filebrowserImageBrowseLinkUrl = "/ckeditor/pictures";

  // The location of an external file browser, that should be launched when "Browse Server" button is pressed in the Image dialog.
  config.filebrowserImageBrowseUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads in the Image dialog.
  config.filebrowserImageUploadUrl = "/ckeditor/pictures";

  // The location of a script that handles file uploads.
  config.filebrowserUploadUrl = "/ckeditor/attachment_files";

  }
}
;
