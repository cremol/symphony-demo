<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcegeneralsettingsds extends Datasource{

		public $dsParamROOTELEMENT = 'generalsettingsds';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = 'twitter-username-for-displaying-tweets-on-homepage';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';

		

		public $dsParamINCLUDEDELEMENTS = array(
				'website-title',
				'website-title-color',
				'website-title-webfont',
				'website-title-fontsize',
				'twitter-username-for-displaying-tweets-on-homepage',
				'header-background-color',
				'menu-background-color',
				'menu-text-color',
				'menu-text-hover-color',
				'body-background-color',
				'captions-color',
				'paragraph-color',
				'preview-fonts-in-google-webfont-directory'
		);


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array();
		}

		public function about(){
			return array(
				'name' => 'generalsettingsds',
				'author' => array(
					'name' => 'martijn kremers',
					'website' => 'http://www.lovesoul.nl/pagebuilder',
					'email' => 'info@xpresszo.com'),
				'version' => '1.0',
				'release-date' => '2011-05-11T18:46:41+00:00'
			);
		}

		public function getSource(){
			return '10';
		}

		public function allowEditorToParse(){
			return true;
		}

		public function grab(&$param_pool=NULL){
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				include(TOOLKIT . '/data-sources/datasource.section.php');
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
