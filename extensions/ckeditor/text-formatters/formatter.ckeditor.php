<?php

	Class formatterckeditor extends TextFormatter{
		
		function about(){
			return array(
				'name' => 'CKEditor',
				'version' => '1.2.1',
				'release-date' => '2011-04-13',
				'author' => array(
					'name'     => '<a href="http://thecocoabots.com">Tony Arnold</a>, <a href="http://gielberkers.com">Giel Berkers</a>'
				),
				'description' => 'Includes CKEditor, a web-based XHTML editor developed by Frederico Knabben.'
			);
		}
		
		function run($string) {
			return $string;
		}

	}

?>