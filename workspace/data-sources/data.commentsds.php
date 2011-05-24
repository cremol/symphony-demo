<?php

	require_once(TOOLKIT . '/class.datasource.php');

	Class datasourcecommentsds extends Datasource{

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


		public function __construct(&$parent, $env=NULL, $process_params=true){
			parent::__construct($parent, $env, $process_params);
			$this->_dependencies = array('$ds-blogentryds');
		}

		public function about(){
			return array(
				'name' => 'commentsds',
				'author' => array(
					'name' => 'martijn kremers',
					'website' => 'http://www.lovesoul.nl/pagebuilder',
					'email' => 'info@xpresszo.com'),
				'version' => '1.0',
				'release-date' => '2011-05-09T20:37:34+00:00'
			);
		}

		public function getSource(){
			return '12';
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
