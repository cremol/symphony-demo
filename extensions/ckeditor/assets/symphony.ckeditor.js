if (typeof Symphony.ADMIN == "undefined") {
	Symphony.ADMIN = window.location.toString().match(/^(.+\/symphony)/)[1];
}


jQuery(document).ready(function () {

    // Set the configurationdata:
    CKEDITOR.config.language = 'en';
    CKEDITOR.config.skin = 'chris';
    // CKEDITOR.config.height = this.offsetHeight;
    CKEDITOR.config.removePlugins = 'font,styles';
    CKEDITOR.config.startupOutlineBlocks = true;
    CKEDITOR.config.replaceByClassEnabled = false;
    CKEDITOR.config.toolbar =
    [
        ['Format'],
        ['Bold', 'Italic', 'Strike', '-', 'Subscript', 'Superscript'],
        ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
        ['Link', 'Unlink'],
        ['HorizontalRule'],
        ['Source', 'Maximize']
    ];
    CKEDITOR.config.forcePasteAsPlainText = true;
    CKEDITOR.config.format_tags = 'p;h1;h2;h3';
    CKEDITOR.config.entities_processNumerical = 'force';
    CKEDITOR.config.filebrowserBrowseUrl = Symphony.ADMIN + '/extension/ckeditor/filebrowser/';

	// See if there are any ckeditor textareas:
    jQuery('textarea.ckeditor').each(function(index) {
		
		// Disable replacing by class:
		CKEDITOR.replaceByClassEnabled = false;
		
		// Set the objectname:
        var objectName = jQuery(this).attr('name');

		// Do not add linebreaks and spaces after opening and before closing tags.
		CKEDITOR.on('instanceReady', function(ev){
			var tags = ['p', 'ol', 'ul', 'li']; // etc.
			for (var key in tags) {
				ev.editor.dataProcessor.writer.setRules(tags[key],
                {
                    indent : false,
                    breakBeforeOpen : true,
                    breakAfterOpen : false,
                    breakBeforeClose : false,
                    breakAfterClose : true
                });
			}
		});
		
		// Replace CKEditor instances:
        CKEDITOR.replace(objectName); //, configurationData);
    });
});