<?php

	Class extension_color_chooser_field extends Extension{
	
		public function about(){
			return array('name' => 'Field: Color Chooser',
						 'version' => '1.2.1',
						 'release-date' => '2010-07-19',
						 'author' => array('name' => 'Josh Nichols',
										   'website' => 'http://www.joshnichols.com',
										   'email' => 'mrblank@gmail.com'),
						 'description'	=> 'A custom field extension for choosing colors.'
				 		);
		}
		
		public function uninstall(){
			$this->_Parent->Database->query("DROP TABLE `tbl_fields_colorchooser`");
		}

		public function install(){

			return $this->_Parent->Database->query("CREATE TABLE `tbl_fields_colorchooser` (
			  `id` int(11) unsigned NOT NULL auto_increment,
			  `field_id` int(11) unsigned NOT NULL,
			  PRIMARY KEY  (`id`),
			  UNIQUE KEY `field_id` (`field_id`)
			) TYPE=MyISAM");

		}
		
		public function getSubscribedDelegates() {
			return array(
				array(
					'page'		=> '/backend/',
					'delegate'	=> 'InitaliseAdminPageHead',
					'callback'	=> 'initaliseAdminPageHead'
				)
			);
		}

		public function initaliseAdminPageHead($context) {
			$page = $context['parent']->Page;

            $page->addScriptToHead(URL . '/extensions/color_chooser_field/assets/jquery.farbtastic.js', 3001);
            $page->addScriptToHead(URL . '/extensions/color_chooser_field/assets/jquery.tools.min.js', 3002);
			$page->addScriptToHead(URL . '/extensions/color_chooser_field/assets/jquery.color-chooser.js', 3003);
            $page->addStylesheetToHead(URL . '/extensions/color_chooser_field/assets/farbtastic.css', 'screen', 3004);
		}
			
	}

?>