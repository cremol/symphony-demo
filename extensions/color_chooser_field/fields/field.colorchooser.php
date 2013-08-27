<?php

	require_once(EXTENSIONS.'/color_chooser_field/extension.driver.php');



	Class fieldColorChooser extends Field
	{

		function __construct(){
			parent::__construct();
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

			if( !parent::commit() ) return false;

			$id = $this->get('id');

			if( $id === false ) return false;

			$fields = array();

			$fields['field_id'] = $id;

			Symphony::Database()->query("DELETE FROM `tbl_fields_".$this->handle()."` WHERE `field_id` = '$id' LIMIT 1");
			return Symphony::Database()->insert($fields, 'tbl_fields_'.$this->handle());

		}

		function groupRecords($records){

			if( !is_array($records) || empty($records) ) return;

			$groups = array($this->get('element_name') => array());

			foreach( $records as $r ){
				$data = $r->getData($this->get('id'));

				$value = $data['value'];

				if( !isset($groups[$this->get('element_name')][$value]) ){
					$groups[$this->get('element_name')][$value] = array('attr' => array('value' => $value),
						'records' => array(), 'groups' => array());
				}

				$groups[$this->get('element_name')][$value]['records'][] = $r;

			}

			return $groups;
		}

		function displaySettingsPanel(&$wrapper, $errors = NULL){
			parent::displaySettingsPanel($wrapper, $errors);
			$this->appendRequiredCheckbox($wrapper);
			$this->appendShowColumnCheckbox($wrapper);
		}

		function displayPublishPanel(&$wrapper, $data = NULL, $flagWithError = NULL, $fieldnamePrefix = NULL, $fieldnamePostfix = NULL){

			Extension_Color_Chooser_Field::appendAssets();

			$value = $data['value'];
			$label = Widget::Label($this->get('label'));
			$label->setAttribute('class', 'color-chooser');
			if( $this->get('required') != 'yes' ) $label->appendChild(new XMLElement('i', 'Optional'));
			$label->appendChild(Widget::Input('fields'.$fieldnamePrefix.'['.$this->get('element_name').']'.$fieldnamePostfix, (strlen($value) != 0 ? $value : '#')));

			if( $flagWithError != NULL ) $wrapper->appendChild(Widget::wrapFormElementWithError($label, $flagWithError));
			else $wrapper->appendChild($label);
		}

		public function displayDatasourceFilterPanel(&$wrapper, $data = NULL, $errors = NULL, $fieldnamePrefix = NULL, $fieldnamePostfix = NULL){
			$wrapper->appendChild(new XMLElement('h4', $this->get('label').' <i>'.$this->Name().'</i>'));
			$label = Widget::Label('Value');
			$label->appendChild(Widget::Input('fields[filter]'.($fieldnamePrefix ? '['.$fieldnamePrefix.']' : '').'['.$this->get('id').']'.($fieldnamePostfix ? '['.$fieldnamePostfix.']' : ''), ($data ? General::sanitize($data) : NULL)));
			$wrapper->appendChild($label);

			$wrapper->appendChild(new XMLElement('p', 'Accepts a 6 character color hex value beginning with \'#\'.', array('class' => 'help')));

		}

		public function checkPostFieldData($data, &$message, $entry_id = NULL){
			$message = NULL;

			if( $this->get('required') == 'yes' && strlen($data) == 0 ){
				$message = "This is a required field.";
				return self::__MISSING_FIELDS__;
			}
			// The Farbtastic needs a value in the field to work. '#' is the default value placed by the js.
			if( $this->get('required') == 'yes' && $data == "#" ){
				$message = "This is a required field.";
				return self::__MISSING_FIELDS__;
			}
			// Make sure the value entered is a valid hex color, '#' or '' is OK
			if( $data !== '#' && strlen($data) !== 0 ){
				if( !preg_match("/^#[0-9a-f]{6}$/i", $data) ){
					$message = "This is not a valid 6 character hex color value.";
					return self::__MISSING_FIELDS__;
				}
			}

			return self::__OK__;

		}

		public function getDecimalValue($data) {
			return hexdec($data);
		}
		
		public function splitToDecimal($data) {
			$rgb[0] = $this->getDecimalValue(substr($data,1,2));
			$rgb[1] = $this->getDecimalValue(substr($data,3,2));
			$rgb[2] = $this->getDecimalValue(substr($data,5,2));
			return $rgb;
		}
		/**
		 * Append the formatted XML output of this field as utilized as a data source.
		 *
		 * @param XMLElement $wrapper
		 *	the XML element to append the XML representation of this to.
		 * @param array $data
		 *	the current set of values for this field. the values are structured as
		 *	for displayPublishPanel.
		 * @param boolean $encode (optional)
		 *	flag as to whether this should be html encoded prior to output. this
		 *	defaults to false.
		 * @param string $mode
		 *	 A field can provide ways to output this field's data. For instance a mode
		 *  could be 'items' or 'full' and then the function would display the data
		 *  in a different way depending on what was selected in the datasource
		 *  included elements.
		 * @param integer $entry_id (optional)
		 *	the identifier of this field entry instance. defaults to null.
		 */
		public function appendFormattedElement(XMLElement &$wrapper, $data, $encode = false, $mode = null, $entry_id = null) {

			$newItem = new XMLElement($this->get('element_name'), ($encode ? General::sanitize($this->prepareTableValue($data, null, $entry_id)) : $this->prepareTableValue($data, null, $entry_id)));
			
			//Check if we have a full color before split
			if(strlen($data["value"]) == 7 ) {
				$rgb = $this->splitToDecimal($data["value"]);
				$newItem->setAttribute("r",$rgb[0]);
				$newItem->setAttribute("g",$rgb[1]);
				$newItem->setAttribute("b",$rgb[2]);
				$newItem->setAttribute("has-color","Yes");
			}else {
				$newItem->setAttribute("has-color","No");
			}
			$wrapper->appendChild($newItem);
		}
		
		public function createTable(){

			return Symphony::Database()->query(

				"CREATE TABLE IF NOT EXISTS `tbl_entries_data_".$this->get('id')."` (
						  `id` int(11) unsigned NOT NULL auto_increment,
						  `entry_id` int(11) unsigned NOT NULL,
						  `value` varchar(32) default NULL,
						  PRIMARY KEY  (`id`),
						  KEY `entry_id` (`entry_id`),
						  KEY `value` (`value`)
						) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;"

			);
		}

	}

?>
