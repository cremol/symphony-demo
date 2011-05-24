<?php
	
	Class fieldOrder_Entries extends Field{
	
		const SIMPLE = 0;
		const REGEXP = 1;
		const RANGE = 3;
		const ERROR = 4;	
		
		function __construct(&$parent){
			parent::__construct($parent);
			$this->_name = __('Entry Order');
			$this->_required = false;
			
			$this->set('hide', 'no');
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
			
			$order = $this->get('sortorder');
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][force_sort]", 'yes', 'checkbox');
			if($this->get('force_sort') == 'yes') $input->setAttribute('checked', 'checked');			
			$label->setValue(__('%s Disable sorting of other columns when enabled', array($input->generate())));
			$wrapper->appendChild($label);
			
			$label = Widget::Label();
			$input = Widget::Input("fields[{$order}][hide]", 'yes', 'checkbox');
			if ($this->get('hide') == 'yes') $input->setAttribute('checked', 'checked');
			$label->setValue(__('%s Hide this field on publish page', array($input->generate())));
			$wrapper->appendChild($label);
			
		}
		
		function commit(){
			if(!parent::commit()) return false;
			
			$id = $this->get('id');
			if($id === false) return false;
			
			$fields = array();
			
			$fields['field_id'] = $id;
			$fields['force_sort'] = $this->get('force_sort');
			$fields['hide'] = $this->get('hide');

			Symphony::Database()->query("DELETE FROM `tbl_fields_".$this->handle()."` WHERE `field_id` = '$id' LIMIT 1");
			return Symphony::Database()->insert($fields, 'tbl_fields_' . $this->handle());					
			
		}

		function displayPublishPanel(&$wrapper, $data=NULL, $flagWithError=NULL, $fieldnamePrefix=NULL, $fieldnamePostfix=NULL){
			$value = $data['value'];
					
			$label = Widget::Label($this->get('label'));
			if($this->get('required') != 'yes') $label->appendChild(new XMLElement('i', __('Optional')));
			
			$max_position = Symphony::Database()->fetchRow(0, "SELECT max(value) AS max FROM tbl_entries_data_{$this->get('id')}");
			
			$input = Widget::Input(
				'fields' . $fieldnamePrefix . '[' . $this->get('element_name') . ']' . $fieldnamePostfix,
				(strlen($value) != 0 ? $value : ++$max_position["max"]),
				($this->get('hide') == 'yes') ? 'hidden' : 'text'
			);
			
			if ($this->get('hide') != 'yes') {
				$label->appendChild($input);			
				if($flagWithError != NULL) $wrapper->appendChild(Widget::wrapFormElementWithError($label, $flagWithError));
				else $wrapper->appendChild($label);
			} else {
				$wrapper->appendChild($input);
			}		
			
		}

		public function displayDatasourceFilterPanel(&$wrapper, $data=NULL, $errors=NULL, $fieldnamePrefix=NULL, $fieldnamePostfix=NULL){
			$wrapper->appendChild(new XMLElement('h4', $this->get('label') . ' <i>'.$this->Name().'</i>'));
			$label = Widget::Label('Value');
			$label->appendChild(Widget::Input('fields[filter]'.($fieldnamePrefix ? '['.$fieldnamePrefix.']' : '').'['.$this->get('id').']'.($fieldnamePostfix ? '['.$fieldnamePostfix.']' : ''), ($data ? General::sanitize($data) : NULL)));	
			$wrapper->appendChild($label);
			$wrapper->appendChild(new XMLElement('p', __('To filter by ranges, add <code>%s</code> to the beginning of the filter input. Use <code>%s</code> for field name. E.G. <code>%s</code>', array('mysql:', 'value', 'mysql: value &gt;= 1.01 AND value &lt;= {$price}')), array('class' => 'help')));
		}
		
		public function checkPostFieldData($data, &$message, $entry_id=NULL){
			$message = NULL;
			
			if($this->get('required') == 'yes' && strlen($data) == 0){
				$message = __('This is a required field.');
				return self::__MISSING_FIELDS__;
			}
			
			if(strlen($data) > 0 && !is_numeric($data)){
				$message = __('Must be a number.');
				return self::__INVALID_FIELDS__;	
			}
						
			return self::__OK__;		
		}
		
		public function createTable(){
			
			return Symphony::Database()->query(
			
				"CREATE TABLE IF NOT EXISTS `tbl_entries_data_" . $this->get('id') . "` (
				  `id` int(11) unsigned NOT NULL auto_increment,
				  `entry_id` int(11) unsigned NOT NULL,
				  `value` double default NULL,
				  PRIMARY KEY  (`id`),
				  KEY `entry_id` (`entry_id`),
				  KEY `value` (`value`)
				) TYPE=MyISAM;"
			
			);
		}		

		function buildDSRetrivalSQL($data, &$joins, &$where, $andOperation=false){
			
			## Check its not a regexp
			if(preg_match('/^mysql:/i', $data[0])){
				
				$field_id = $this->get('id');
				
				$expression = str_replace(array('mysql:', 'value'), array('', " `t$field_id`.`value` " ), $data[0]);
				
				$joins .= " LEFT JOIN `tbl_entries_data_$field_id` AS `t$field_id` ON (`e`.`id` = `t$field_id`.entry_id) ";
				$where .= " AND $expression ";
				
			}			
			
			else parent::buildDSRetrivalSQL($data, $joins, $where, $andOperation);
			
			return true;
			
		}
		
		public function prepareTableValue($data, XMLElement $link = null) {
			return sprintf('<span class="order">%d</span>', $data['value']);
		}
				
	}

?>