<?php

	Class Extension_Color_Chooser_Field extends Extension
	{
		private static $assets_loaded = false;

		public function uninstall(){
			try{
				Symphony::Database()->query("DROP TABLE `tbl_fields_colorchooser`");
			} catch( Exception $e ){
			}

			return true;
		}

		public function install(){
			return Symphony::Database()->query("CREATE TABLE `tbl_fields_colorchooser` (
			  `id` int(11) unsigned NOT NULL auto_increment,
			  `field_id` int(11) unsigned NOT NULL,
			  PRIMARY KEY  (`id`),
			  UNIQUE KEY `field_id` (`field_id`)
			) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;");
		}

		public static function appendAssets(){
			if( self::$assets_loaded === false
				&& class_exists('Administration')
				&& Administration::instance() instanceof Administration
				&& Administration::instance()->Page instanceof HTMLPage
			){

				self::$assets_loaded = true;

				$page = Administration::instance()->Page;

				$page->addScriptToHead(URL.'/extensions/color_chooser_field/assets/jquery.farbtastic.js', 3001);
				$page->addScriptToHead(URL.'/extensions/color_chooser_field/assets/jquery.tools.min.js', 3002);
				$page->addScriptToHead(URL.'/extensions/color_chooser_field/assets/jquery.color-chooser.js', 3003);
				$page->addStylesheetToHead(URL.'/extensions/color_chooser_field/assets/farbtastic.css', 'screen', 3004);
			}
		}
	}

?>
