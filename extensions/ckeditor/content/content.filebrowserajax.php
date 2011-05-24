<?php
	require_once(TOOLKIT . '/class.htmlpage.php');
	require_once(TOOLKIT . '/class.sectionmanager.php');
	require_once(TOOLKIT . '/class.entrymanager.php');
    require_once(TOOLKIT . '/class.extensionmanager.php');

	Class contentExtensionCkeditorFilebrowserajax extends HTMLPage
	{
		function __construct(&$parent){
			parent::__construct($parent);			
		}
		
		function build($context)
		{
			$this->setTitle('Symphony - File Browser for CKEditor');
			
			if(!Administration::instance()->isLoggedIn()){
				$this->_Parent->customError(E_USER_ERROR, __('Access Denied'), __('You are not authorised to access this page.'));
				exit();
			}
			
			$this->addElementToHead(new XMLElement('meta', NULL, array('http-equiv' => 'Content-Type', 'content' => 'text/html; charset=UTF-8')), 0);
			$this->addHeaderToPage('Content-Type', 'text/html; charset=UTF-8');
			
			## Build the form
			
			$form = Widget::Form(Administration::instance()->getCurrentPageURL(), 'post');
			
			// Get the section:
			if(isset($_GET['id'])) {
				$sectionID = intval($_GET['id']);
				$sectionManager = new SectionManager($this);
				$section = $sectionManager->fetch($sectionID);

				if($section != false)
				{
					$div = new XMLElement('div', null, array('class'=>'items'));
                    // Check if JIT is installed:
                    $extensionManager = new ExtensionManager($this);
                    $status = $extensionManager->fetchStatus('jit_image_manipulation');
                    $jitEnabled = $status == EXTENSION_ENABLED;

					// Get the field id's:
                    $fields = $section->fetchFields();
                    $fieldIDs = array();
                    foreach($fields as $field)
                    {
                        $fieldIDs[] = $field->get('id');
                    }

					// Add rows:
					$entryManager = new EntryManager($this);
					$entries = $entryManager->fetch(null, $sectionID);
					foreach($entries as $entry)
					{
						$data = $entry->getData();
						$name = false;
						foreach($fieldIDs as $id)
						{
							$info = $data[$id];
                            if(isset($info['value'])) {
                                if($name == false) {
                                    $name = $info['value'];
                                }
                            } elseif(isset($info['handle'])) {
                                if($name == false) {
                                    $name = $info['handle'];
                                }
                            } elseif(isset($info['file'])) {
                                if($name == false) {
                                    $name = basename($info['file']);
                                }
                                $value = '<a href="/workspace'.$info['file'].'">';
                                // Check if JIT is enabled:
                                if($jitEnabled &&
                                   ($info['mimetype'] == 'image/jpeg' ||
                                   $info['mimetype'] == 'image/jpg' ||
                                   $info['mimetype'] == 'image/png' ||
                                   $info['mimetype'] == 'image/gif'))
                                {
                                    $value .= '<img src="/image/2/100/100/5'.$info['file'].'" alt="thumb" width="100" height="100" />';
                                } else {
                                    // Show an icon according to it's extension:
                                    $a = explode('.', basename($info['file']));
                                    $ext = strtolower($a[count($a)-1]);
                                    $value .= '<img src="'.$this->getImage($ext).'" alt="thumb" width="64" heigh="64" class="icon" />';
                                }
                                $value .= '<br />'.$name.'</a>';
                                $item = new XMLElement('div', $value);
                                $div->appendChild($item);
                            }
                        }
					}

					$form->appendChild(new XMLElement('a', __('create new'), array('href'=>'/symphony/publish/'.$section->get('handle').'/new/', 'class'=>'create button')));
					$form->appendChild(new XMLElement('h3', $section->get('name')));
					$form->appendChild($div);
					$form->appendChild(new XMLElement('div', '', array('id'=>'thumb')));
				}
			}
			
			$this->Body->appendChild($form);
			
		}

        private function getImage($extension)
        {
            switch($extension)
            {
                case 'jpeg' :
                case 'jpg' :
                case 'png' :
                case 'gif' :
                case 'bmp' :
                    {
                        $image = 'image.png';
                        break;
                    }
                case 'pdf' :
                    {
                        $image = 'pdf.png';
                        break;
                    }
                case 'doc' :
                case 'docx' :
                case 'rtf' :
                case 'odt' :
                    {
                        $image = 'doc.png';
                        break;
                    }
                case 'xls' :
                case 'xlsx' :
                case 'ods' :
                    {
                        $image = 'spreadsheet.png';
                        break;
                    }
                case 'ppt' :
                case 'pptx' :
                case 'odp' :
                    {
                        $image = 'presentation.png';
                        break;
                    }
                case 'ttf' :
                case 'otf' :
                    {
                        $image = 'font.png';
                        break;
                    }
                case 'html' :
                case 'css' :
                case 'php' :
                case 'js' :
                case 'xsl' :
                    {
                        $image = 'html.png';
                        break;
                    }
                case 'mp3' :
                case 'wav' :
                case 'aif' :
                case 'aiff' :
                case 'wma' :
                    {
                        $image = 'sound.png';
                        break;
                    }
                case 'fla' :
                case 'swf' :
                    {
                        $image = 'swf.png';
                        break;
                    }
                case 'txt' :
                    {
                        $image = 'txt.png';
                        break;
                    }
                case 'wmv' :
                case 'mov' :
                case 'mpeg' :
                case 'mpg' :
                case 'avi' :
                case 'mp4' :
                case 'flv' :
                    {
                        $image = 'video.png';
                        break;
                    }
                case 'zip' :
                case 'rar' :
                case '7z' :
                    {
                        $image = 'zip.png';
                        break;
                    }
                default:
                    {
                        $image = 'unknown.png';
                        break;
                    }
            }
            return URL.'/extensions/ckeditor/assets/images/'.$image;
        }
	}
?>