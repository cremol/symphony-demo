<?php
	
	Class fieldColorChooser extends Field{
		
				function __construct(&$parent){
					parent::__construct($parent);
					$this->_name = 'Color Chooser';
					$this->_required = true;
					$this->set('required', 'yes');
				}

				function isSortable(){
					return true;
				}

				function canFilter(){
					return true;
				}

				function allowDatasourceOutputGrouping(){
					return true;
				}

				function allowDatasourceParamOutput(){
					return true;
				}

				function canPrePopulate(){
					return true;
				}		

				function commit(){

					if(!parent::commit()) return false;

					$id = $this->get('id');

					if($id === false) return false;

					$fields = array();

					$fields['field_id'] = $id;

					$this->_engine->Database->query("DELETE FROM `tbl_fields_".$this->handle()."` WHERE `field_id` = '$id' LIMIT 1");		
					return $this->_engine->Database->insert($fields, 'tbl_fields_' . $this->handle());

				}

				function groupRecords($records){

					if(!is_array($records) || empty($records)) return;

					$groups = array($this->get('element_name') => array());

					foreach($records as $r){
						$data = $r->getData($this->get('id'));

						$value = $data['value'];

						if(!isset($groups[$this->get('element_name')][$value])){
							$groups[$this->get('element_name')][$value] = array('attr' => array('value' => $value),
																				 'records' => array(), 'groups' => array());
						}	

						$groups[$this->get('element_name')][$value]['records'][] = $r;

					}

					return $groups;
				}

				function displaySettingsPanel(&$wrapper, $errors=NULL){
					parent::displaySettingsPanel($wrapper, $errors);
					$this->appendRequiredCheckbox($wrapper);
					$this->appendShowColumnCheckbox($wrapper);
				}

				function displayPublishPanel(&$wrapper, $data=NULL, $flagWithError=NULL, $fieldnamePrefix=NULL, $fieldnamePostfix=NULL){
					
					//$this->_engine->Page->addScriptToHead(URL . '/extensions/color_chooser_field/assets/farbtastic.js', 180);
					//$this->_engine->Page->addScriptToHead(URL . '/extensions/color_chooser_field/assets/color-chooser.js', 185);
					//$this->_engine->Page->addStylesheetToHead(URL . '/extensions/color_chooser_field/assets/farbtastic.css', 'screen', 190);
					
					$value = $data['value'];		
					$label = Widget::Label($this->get('label'));
					$label->setAttribute('class', 'color-chooser');
					if($this->get('required') != 'yes') $label->appendChild(new XMLElement('i', 'Optional'));
					$label->appendChild(Widget::Input('fields'.$fieldnamePrefix.'['.$this->get('element_name').']'.$fieldnamePostfix, (strlen($value) != 0 ? $value : '#')));

					if($flagWithError != NULL) $wrapper->appendChild(Widget::wrapFormElementWithError($label, $flagWithError));
					else $wrapper->appendChild($label);
				}

				public function displayDatasourceFilterPanel(&$wrapper, $data=NULL, $errors=NULL, $fieldnamePrefix=NULL, $fieldnamePostfix=NULL){
					$wrapper->appendChild(new XMLElement('h4', $this->get('label') . ' <i>'.$this->Name().'</i>'));
					$label = Widget::Label('Value');
					$label->appendChild(Widget::Input('fields[filter]'.($fieldnamePrefix ? '['.$fieldnamePrefix.']' : '').'['.$this->get('id').']'.($fieldnamePostfix ? '['.$fieldnamePostfix.']' : ''), ($data ? General::sanitize($data) : NULL)));	
					$wrapper->appendChild($label);

					$wrapper->appendChild(new XMLElement('p', 'Accepts a 6 character color hex value beginning with \'#\'.', array('class' => 'help')));

				}

				public function checkPostFieldData($data, &$message, $entry_id=NULL){
					$message = NULL;

					if($this->get('required') == 'yes' && strlen($data) == 0 ){
						$message = "This is a required field.";
						return self::__MISSING_FIELDS__;
					}
					// The Farbtastic needs a value in the field to work. '#' is the default value placed by the js.
					if($this->get('required') == 'yes' && $data == "#" ){
						$message = "This is a required field.";
						return self::__MISSING_FIELDS__;
					}
					// Make sure the value entered is a valid hex color, '#' or '' is OK
					if($data !== '#' && strlen($data) !== 0 ){
						if(!preg_match("/^#[0-9a-f]{6}$/i" , $data)){
							$message = "This is not a valid 6 character hex color value.";
							return self::__MISSING_FIELDS__;
						}
					}

					return self::__OK__;
							
				}

				public function createTable(){

					return $this->Database->query(

						"CREATE TABLE IF NOT EXISTS `tbl_entries_data_" . $this->get('id') . "` (
						  `id` int(11) unsigned NOT NULL auto_increment,
						  `entry_id` int(11) unsigned NOT NULL,
						  `value` varchar(32) default NULL,
						  PRIMARY KEY  (`id`),
						  KEY `entry_id` (`entry_id`),
						  KEY `value` (`value`)
						) TYPE=MyISAM;"

					);
				}		

			}

		?>