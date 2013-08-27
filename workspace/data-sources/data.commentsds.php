<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecommentsds extends SectionDatasource {

		public $dsParamROOTELEMENT = 'commentsds';
		public $dsParamORDER = 'asc';
		public $dsParamPAGINATERESULTS = 'yes';
		public $dsParamLIMIT = '999';
		public $dsParamSTARTPAGE = '1';
		public $dsParamREDIRECTONEMPTY = 'no';
		public $dsParamSORT = 'system:id';
		public $dsParamASSOCIATEDENTRYCOUNTS = 'no';
		

		public $dsParamFILTERS = array(
				'58' => '{$ds-blogentryds}',
		);
		

		public $dsParamINCLUDEDELEMENTS = array(
				'name',
				'email',
				'website',
				'date',
				'article',
				'comment: formatted'
		);
		

		public function __construct($env=NULL, $process_params=true) {
			parent::__construct($env, $process_params);
			$this->_dependencies = array('$ds-blogentryds');
		}

		public function about() {
			return array(
				'name' => 'commentsds',
				'author' => array(
					'name' => 'martijn kremers',
					'website' => 'http://localhost:8888/symphony-demo',
					'email' => 'info@xpresszo.com'),
				'version' => 'Symphony 2.3.3',
				'release-date' => '2013-08-26T19:18:04+00:00'
			);
		}

		public function getSource() {
			return '12';
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
