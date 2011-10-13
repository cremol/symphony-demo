if (typeof Symphony.ADMIN == "undefined") {
	Symphony.ADMIN = window.location.toString().match(/^(.+\/symphony)/)[1];
}

jQuery(document).ready(function () {
	// See if there are any ckeditor textareas:
    jQuery('textarea.ckeditor, textarea.ckeditor_compact').each(function(index) {
        // Set the configurationdata:
        var configurationData = {};
        configurationData.language = 'en';
        configurationData.skin = 'chris';
        configurationData.replaceByClassEnabled = false;
        configurationData.forcePasteAsPlainText = true;
        configurationData.format_tags = 'p;h1;h2;h3';
        configurationData.entities_processNumerical = 'force';
        configurationData.filebrowserBrowseUrl = Symphony.ADMIN + '/extension/ckeditor/filebrowser/';
        // Set the correct height:
        configurationData.height = jQuery(this).height();

        // Check if this is the compact CKEditor:
        if(jQuery(this).hasClass("ckeditor_compact"))
        {
            jQuery(this).parent().addClass("ck_compact");
            configurationData.toolbar =
            [
                ['Bold', 'Italic', 'Strike', '-', 'Subscript', 'Superscript'],
                ['Link', 'Unlink'],
                ['Source']
            ];
            configurationData.resize_enabled = false;
            configurationData.removePlugins = 'font,styles,elementspath';
            configurationData.startupOutlineBlocks = false;
        } else {
            configurationData.toolbar =
            [
                ['Format'],
                ['Bold', 'Italic', 'Strike', '-', 'Subscript', 'Superscript'],
                ['NumberedList', 'BulletedList', '-', 'Outdent', 'Indent', 'Blockquote'],
                ['Link', 'Unlink'],
                ['HorizontalRule'],
                ['Source', 'Maximize']
            ];
            configurationData.resize_enabled = true;
            configurationData.removePlugins = 'font,styles';
            configurationData.startupOutlineBlocks = true;
        }

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
            // Add a border:
            jQuery("label.ck_compact td.cke_contents").css({borderBottom: "1px solid #aaa"});
		});

		// Replace CKEditor instances:
        CKEDITOR.replace(objectName, configurationData);
    });
});