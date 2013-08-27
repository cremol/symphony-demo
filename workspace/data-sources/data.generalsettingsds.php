<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcegeneralsettingsds extends SectionDatasource {

		public $dsParamROOTELEMENT = 'generalsettingsds';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '20';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamPARAMOUTPUT = array(
				'twitter-username-for-displaying-tweets-on-homepage'
		);
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
				'paragraph-color'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'generalsettingsds',
				'author' => array(
					'name' => 'martijn kremers',
					'website' => 'http://localhost:8888/symphony-demo',
					'email' => 'info@xpresszo.com'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-08-26T19:18:09+00:00'
			);
		}

		public function getSource() {
			return '10';
		}

		public function allowEditorToParse() {
			return true;
		}

		public function execute(array &$param_pool = null) {
			$result = new XMLElement($this->dsParamROOTELEMENT);

			try{
				$result = parent::execute($param_pool);
			}
			catch(FrontendPageNotFoundException $e){
				// Work around. This ensures the 404 page is displayed and
				// is not picked up by the default catch() statement below
				FrontendPageNotFoundExceptionHandler::render($e);
			}
			catch(Exception $e){
				$result->appendChild(new XMLElement('error', $e->getMessage() . ' on ' . $e->getLine() . ' of file ' . $e->getFile()));
				return $result;
			}

			if($this->_force_empty_result) $result = $this->emptyXMLSet();

			return $result;
		}

	}
