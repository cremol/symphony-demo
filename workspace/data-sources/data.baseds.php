<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcebaseds extends SectionDatasource {

		public $dsParamROOTELEMENT = 'baseds';
		public $dsParamORDER = 'desc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '1';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'yes';
		public $dsParamREQUIREDPARAM = '$page';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'23' => '{$page}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'title',
				'content: formatted',
				'slideshow: title',
				'slideshow: image',
				'slideshow: description: formatted',
				'sidebar: title',
				'sidebar: image',
				'sidebar: description: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array();
		}

		public function about() {
			return array(
				'name' => 'baseds',
				'author' => array(
					'name' => 'martijn kremers',
					'website' => 'http://localhost:8888/symphony-demo',
					'email' => 'info@xpresszo.com'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-08-26T19:29:01+00:00'
			);
		}

		public function getSource() {
			return '7';
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
