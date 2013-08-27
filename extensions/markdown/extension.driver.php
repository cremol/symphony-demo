<?php

	Class extension_Markdown extends Extension{
		public function about(){
			return array(
				'name' => 'Text Formatter: Markdown',
				'version' => '1.17',
				'release-date' => '2013-07-01',
				'author' => array(
					'name' => 'Alistair Kearney',
					'website' => 'http://getsymphony.com',
					'email' => 'alistair@getsymphony.com'
				),
				'description' => 'Includes "Markdown", "Markdown Extra", "Markdown Extra with Smartypants" and "Markdown with HTML Purifier" text formatters. PHP implementation of the "Markdown" text-to-HTML syntax, created by John Gruber, developed by Michel Fortin.'
			);
		}

		public function update($previousVersion = false){
			if(version_compare($previousVersion, '1.10', '<')){

				$conversion = array(
					'pb_markdown' => 'markdown',
					'pb_markdownextrasmartypants' => 'markdown_extra_with_smartypants',
					'pb_markdownextra' => 'markdown_extra'
				);

				foreach($conversion as $old => $new){

					try{
						Symphony::Database()->query(
							sprintf("UPDATE `tbl_fields_textarea` SET `formatter` = '%s' WHERE `formatter` = '%s'", $new, $old)
						);
					}
					catch(Exception $e){
					}

					try{
						Symphony::Database()->query(
							sprintf("UPDATE `tbl_fields_textbox` SET `text_formatter` = '%s' WHERE `text_formatter` = '%s'", $new, $old)
						);
					}
					catch(Exception $e){
					}

				}

			}

			return true;
		}

	}
