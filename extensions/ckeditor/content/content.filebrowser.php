<?php
	require_once(TOOLKIT . '/class.htmlpage.php');
	require_once(TOOLKIT . '/class.sectionmanager.php');
	require_once(TOOLKIT . '/class.extensionmanager.php');

	Class contentExtensionCkeditorFilebrowser extends HTMLPage
	{
		public function __construct(&$parent){
			parent::__construct($parent);
		}
		
		
		public function build($context)
		{
			// Build the page:
			$this->setTitle('Symphony - File Browser for CKEditor');
			$this->addElementToHead(new XMLElement('meta', NULL, array('http-equiv' => 'Content-Type', 'content' => 'text/html; charset=UTF-8')), 0);
			$this->addStylesheetToHead(URL . '/symphony/assets/basic.css', 'screen', 68);
			$this->addStylesheetToHead(URL . '/symphony/assets/admin.css', 'screen', 69);
			$this->addStylesheetToHead(URL . '/extensions/ckeditor/assets/filebrowser.css', 'screen', 70);
			$this->addScriptToHead(URL . '/symphony/assets/jquery.js', 50);
			$this->addScriptToHead(URL . '/extensions/ckeditor/assets/jquery.form.js', 51);
			$this->addScriptToHead(URL . '/extensions/ckeditor/assets/filebrowser.js', 52);
			$this->addHeaderToPage('Content-Type', 'text/html; charset=UTF-8');
			
			// Check for unauthorized access:
			if(!Administration::instance()->isLoggedIn()){
				$this->_Parent->customError(E_USER_ERROR, __('Access Denied'), __('You are not authorised to access this page.'));
				exit();
			}
			
			$body = new XMLElement('div', '', array('id'=>'body'));

			$left = new XMLElement('div', '', array('class'=>'left'));
			$right = new XMLElement('div', '', array('class'=>'right'));
			$left->appendChild(new XMLElement('h3', __('Section')));
			
			// Get the sections:
			$sectionManager = new SectionManager($this);
			$sections = $sectionManager->fetch();
			
			// Check which sections are allowed:
			$data = Symphony::Configuration()->get('sections', 'ckeditor');
			$checkedSections = $data != false ? explode(',', $data) : array();
			
			if(count($checkedSections) > 0)
			{
				$list = new XMLElement('ul');
				foreach($sections as $section)
				{
					if(in_array($section->get('id'), $checkedSections))
					{
						$item = new XMLElement('li');
						$attributes = array('href'=>'#', 'id'=>$section->get('id'));
						$link = new XMLElement('a', $section->get('name'), $attributes);
						$item->appendChild($link);
						$list->appendChild($item);
					}
				}				
				$left->appendChild($list);
			} else {
				$left->appendChild(new XMLElement('p', __('There are no sections available. Please select which sections are permitted to use the CKEditor file upload feature in the Symphony System Preferences.')));
			}
			
			$body->appendChild($left);
			$body->appendChild($right);
			
			$this->Body->appendChild($body);
		}
		
		
		public function view()
		{
			
			
			
			
			
			// $this->_context = $context;
			/*
			
			*/
			/*
			
			
			$this->Form = new XMLElement('div', '', array('id'=>'body'));
			
			// Check if JIT is installed:
			$extensionManager = new ExtensionManager($this);
			$status = $extensionManager->fetchStatus('jit_image_manipulation');
			
			if($status == EXTENSION_ENABLED)
			{
				$script = 'var jitAvailable = true;';
			} else {
				$script = 'var jitAvailable = false;';
			}
			$this->Form->appendChild(new XMLElement('script', $script, array('type'=>'text/javascript')));
			
			$left = new XMLElement('div', '', array('class'=>'left'));
			$right = new XMLElement('div', '', array('class'=>'right'));
			$left->appendChild(new XMLElement('h3', __('Section')));
			
			// Get the sections:
			$sectionManager = new SectionManager($this);
			$sections = $sectionManager->fetch();
			
			// Check which sections are allowed:
			if(file_exists(MANIFEST.'/ckeditor_sections'))
			{
				$data = @file_get_contents(MANIFEST.'/ckeditor_sections');
			} else {
				$data = array();
			}
			$checkedSections = $data != false ? explode(',', $data) : array();
			
			if(count($checkedSections) > 0)
			{
				$list = new XMLElement('ul');
				foreach($sections as $section)
				{
					if(in_array($section->get('id'), $checkedSections))
					{
						$item = new XMLElement('li');
						$attributes = array('href'=>'#', 'id'=>$section->get('id'));
						$link = new XMLElement('a', $section->get('name'), $attributes);
						$item->appendChild($link);
						$list->appendChild($item);
					}
				}				
				$left->appendChild($list);
			} else {
				$left->appendChild(new XMLElement('p', __('There are no sections available. Please select which sections are permitted to use the CKEditor file upload feature in the Symphony System Preferences.')));
			}
			// $this->Form->appendChild($left);
			// $this->Form->appendChild($right);
			
			$this->_Parent->Profiler->sample('Page content created', PROFILE_LAP);
			*/
		}
	}
?>