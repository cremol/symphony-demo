<?php
	require_once(TOOLKIT . '/class.administrationpage.php');

	Class contentExtensionCkeditorPages extends AdministrationPage
	{
		function __construct(&$parent){
			parent::__construct($parent);			
		}
		
		function build()
		{
			$this->_context = $context;
			
			if(!$this->canAccessPage()){
				$this->_Parent->customError(E_USER_ERROR, __('Access Denied'), __('You are not authorised to access this page.'));
				exit();
			}
			
			// Get a list of all the pages:
			$tree = $this->buildTree();
			echo json_encode($tree);
			die();
		}
		
		private function buildTree($parent = null, $title = '')
		{
			if($parent == null)
			{
				$results = Symphony::Database()->fetch('SELECT `id`, `title`, `handle`, `path` FROM `tbl_pages` WHERE `parent` IS NULL ORDER BY `sortorder` ASC;');
			} else {
				$results = Symphony::Database()->fetch('SELECT `id`, `title`, `handle`, `path` FROM `tbl_pages` WHERE `parent` = '.$parent.' ORDER BY `sortorder` ASC;');
			}
			$tree = array();
			foreach($results as $result)
			{
				$info = array('handle'=>$result['handle'], 'path'=>$result['path']);
				if($result['path'] == null)
				{
					$info['url'] = '/'.$result['handle'].'/';
					$info['title'] = $result['title'];
				} else {
					$info['url'] = '/'.$result['path'].'/'.$result['handle'].'/';
					$info['title'] = $title.$result['title'];
				}
				$tree[] = $info;
				// Get the children:
				$children = $this->buildTree($result['id'], $info['title'].' : ');
				// Join arrays:
				$tree = array_merge($tree, $children);
			}
			
			return $tree;
		}
	}
?>