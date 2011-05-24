<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcetweetsds extends Datasource{

		public $dsParamROOTELEMENT = 'tweetsds';
		public $dsParamURL = 'http://twitter.com/statuses/user_timeline/{$ds-generalsettingsds}.rss';
		public $dsParamXPATH = '/';
		public $dsParamCACHE = '2';
		public $dsParamTIMEOUT = '6';

		

		

		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-generalsettingsds');
		}

		public function about(){
			return array(
				'name' => 'tweetsds',
				'author' => array(
					'name' => 'XpressZo print &amp; web',
					'website' => 'http://www.xpresszo.com/symphony-demo',
					'email' => 'info@xpresszo.com'),
				'version' => '1.0',
				'release-date' => '2011-05-14T14:03:06+00:00'
			);
		}

		public function getSource(){
			return 'dynamic_xml';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.dynamic_xml.php');
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			

			return $result;
		}

	}
