<?php
	$settings = array(


		###### ADMIN ######
		'admin' => array(
			'max_upload_size' => '5242880',
		),
		########


		###### SYMPHONY ######
		'symphony' => array(
			'pagination_maximum_rows' => '20',
			'lang' => 'en',
			'version' => '2.3.3',
			'pages_table_nest_children' => 'yes',
			'session_gc_divisor' => '10',
			'cookie_prefix' => 'sym-',
			'association_maximum_rows' => '5',
		),
		########


		###### LOG ######
		'log' => array(
			'archive' => '1',
			'maxsize' => '102400',
		),
		########


		###### GENERAL ######
		'general' => array(
			'sitename' => 'Symphony Demo ensemble',
			'useragent' => 'Symphony/2.3.3',
		),
		########


		###### IMAGE ######
		'image' => array(
			'cache' => '1',
			'quality' => '90',
			'disable_regular_rules' => 'no',
			'disable_upscaling' => 'no',
		),
		########


		###### DATABASE ######
		'database' => array(
			'query_caching' => 'default',
			'host' => 'localhost',
			'port' => '3306',
			'user' => null,
			'password' => null,
			'db' => null,
			'tbl_prefix' => 'sym_',
		),
		########


		###### PUBLIC ######
		'public' => array(
			'display_event_xml_in_source' => 'yes',
		),
		########


		###### REGION ######
		'region' => array(
			'time_format' => 'H:i',
			'date_format' => 'd F Y',
			'datetime_separator' => ' ',
			'timezone' => 'Europe/Amsterdam',
		),
		########


		###### CKEDITOR ######
		'ckeditor' => array(
			'styles' => null,
		),
		########


		###### MAINTENANCE_MODE ######
		'maintenance_mode' => array(
			'enabled' => 'no',
		),
		########


		###### FILE ######
		'file' => array(
			'write_mode' => '0777',
		),
		########


		###### DIRECTORY ######
		'directory' => array(
			'write_mode' => '0777',
		),
		########


		###### SORTING ######
		'sorting' => array(
			'section_pages_sortby' => '24',
			'section_pages_order' => 'asc',
			'section_images_sortby' => null,
			'section_images_order' => 'asc',
			'section_blog_sortby' => '32',
			'section_blog_order' => 'asc',
			'section_preferences_sortby' => null,
			'section_preferences_order' => 'asc',
			'section_comments_sortby' => null,
			'section_comments_order' => 'asc',
		),
		########


		###### REDACTOR ######
		'redactor' => array(
			'lang' => 'en',
			'direction_ltr' => 'yes',
			'enable_toolbar' => 'yes',
			'enable_source' => 'no',
			'enable_focus' => 'no',
			'enable_shortcuts' => 'yes',
			'enable_autoresizing' => 'no',
			'enable_cleanup' => 'yes',
			'enable_fixed' => 'no',
			'enable_fixedbox' => 'no',
			'enable_paragraphy' => 'yes',
			'enable_convertlinks' => 'yes',
			'enable_convertdivs' => 'yes',
			'enable_fileupload' => 'no',
			'enable_imageupload' => 'yes',
			'enable_overlay' => 'yes',
			'enable_observeimages' => 'yes',
			'enable_airmode' => 'no',
			'enable_wym' => 'yes',
			'enable_mobile' => 'yes',
			'buttons' => 'html,formatting,bold,italic,deleted,unorderedlist,image,link,fontcolor',
			'airbuttons' => 'formatting,bold,italic,deleted,unorderedlist,orderedlist,outdent,indent,fontcolor,backcolor',
			'allowedtags' => 'code,span,div,label,a,br,p,b,i,del,strike,u,img,video,audio,iframe,object,embed,param,blockquote,mark,cite,small,ul,ol,li,hr,dl,dt,dd,sup,sub,big,pre,figure,figcaption,strong,em,table,tr,td,th,tbody,thead,tfoot,h1,h2,h3,h4,h5,h6',
			'filepath' => 'workspace/redactor/files',
			'imagepath' => 'workspace/redactor/images',
		),
		########
	);
