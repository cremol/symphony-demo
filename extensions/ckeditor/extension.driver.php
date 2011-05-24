<?php
	require_once(TOOLKIT . '/class.sectionmanager.php');
	
	Class extension_ckeditor extends Extension
	{	
		/**
		 * Extension information
		 */		 
		public function about() {
			return array(
				'name' => 'Text Formatter: CKEditor',
				'version' => '1.2.1',
				'release-date' => '2011-04-13',
				'author' => array(
					'name'     => '<a href="http://thecocoabots.com">Tony Arnold</a>, <a href="http://gielberkers.com">Giel Berkers</a>'
				),
				'description' => 'Includes CKEditor, a web-based XHTML editor developed by Frederico Knabben. It also has an integrated file browser which uses Symphony sections to get it\'s files from.'
			);
		}
	
		/**
		 * Add callback functions to backend delegates
		 */	
		public function getSubscribedDelegates(){
			return array(
				array('page'		=>	'/backend/',
					  'delegate'	=>	'ModifyTextareaFieldPublishWidget',
					  'callback'	=>	'applyCKEditor'),
				      
				array('page'		=>	'/backend/',
					  'delegate'	=>	'ModifyTextBoxFullFieldPublishWidget',
					  'callback'	=>	'applyCKEditor'),
				
				array('page'		=> '/system/preferences/',
					  'delegate'	=> 'AddCustomPreferenceFieldsets',
					  'callback'	=> 'appendPresets'),
				
				array('page'		=> '/system/preferences/',
					  'delegate'	=> 'Save',
					  'callback'	=> 'savePresets')
			);
		}
		
		/**
		 * Append presets
		 */
		public function appendPresets($context)
		{
			$wrapper = $context['wrapper'];
			
			$fieldset = new XMLElement('fieldset', '', array('class'=>'settings'));
			$fieldset->appendChild(new XMLElement('legend', __('CKEditor File Browser')));
			$fieldset->appendChild(new XMLElement('p', __('Please select the sections that are permitted to use the CKEditor file browser:')));
			
			$sectionManager = new SectionManager($this);
			$sections = $sectionManager->fetch();
			
			// Check which sections are allowed:
			$data = Symphony::Configuration()->get('sections', 'ckeditor');
			$checkedSections = $data != false ? explode(',', $data) : array();
			
			// Bugfix for if there are no sections found:
			if($sections)
			{
				$options = array();
				foreach($sections as $section)
				{
					$options[] = array($section->get('id'), in_array($section->get('id'), $checkedSections), $section->get('name'));
				}
				$fieldset->appendChild(Widget::Select('ckeditor_sections[]', $options, array('multiple'=>'multiple')));
			}
			
			$wrapper->appendChild($fieldset);
		}
		
		/**
		 * Save the presets
		 */
		public function savePresets($context)
		{
			if(isset($_POST['ckeditor_sections'])) {				
				$sectionStr = implode(',', $_POST['ckeditor_sections']);
				// file_put_contents(MANIFEST.'/ckeditor_sections', $sectionStr);
				Symphony::Configuration()->set('sections', $sectionStr, 'ckeditor');
				Administration::instance()->saveConfig();
			} else {
				// If no sections are selected, delete the file:
				$this->uninstall();
			}
		}
		
		/**
		 * On uninstall, delete the ckeditor_sections-file
		 */
		public function uninstall()
		{
			Symphony::Configuration()->remove('sections', 'ckeditor');
			Administration::instance()->saveConfig();
		}
		
		/**
		 * Load and apply CKEditor
		 */		 
 		protected $addedCKEditorHeaders = false;
	
		public function applyCKEditor($context) {		
			if($context['field']->get('formatter') != 'ckeditor') return;
			
			if(!$this->addedCKEditorHeaders){
				Administration::instance()->Page->addScriptToHead(URL . '/extensions/ckeditor/lib/ckeditor/ckeditor.js', 200, false);
				Administration::instance()->Page->addScriptToHead(URL . '/extensions/ckeditor/assets/symphony.ckeditor.js', 210, false);
				Administration::instance()->Page->addStylesheetToHead(URL . '/extensions/ckeditor/assets/symphony.ckeditor.css', 'screen', 30);
				
				$this->addedCKEditorHeaders = true;
			}
		}
		
	}

?>