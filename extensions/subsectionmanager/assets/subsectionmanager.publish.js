
(function($) {
	
	/**
	 * This plugin add an interface for subsection management.
	 *
	 * @author: Nils Hörrmann, post@nilshoerrmann.de
	 * @source: http://github.com/nilshoerrmann/subsectionmanager
	 */
	$(document).ready(function() {

		// Language strings
		Symphony.Language.add({
			'There are no selected items': false,
			'Are you sure you want to delete {$item}? It will be removed from all entries. This step cannot be undone.': false,
			'There are currently no items available. Perhaps you want create one first?': false,
			'New item': false			
		}); 

		// Initialize Subsection Manager
		$('div.field-subsectionmanager').each(function() {
			var manager = $(this),
				storage = manager.find('select'),
				stage = manager.find('div.stage'),
				selection = stage.find('ul.selection'),
				queue = stage.find('div.queue'),
				queue_loaded = false,
				drawer = stage.data('templates.stage').templates.filter('.drawer').removeClass('template'),
				context = manager.find('input[name*=subsection_id]'),
				subsection = context.val(),
				subsectionmanager_id = context.attr('name').match(/\[subsection_id\]\[(.*)\]/)[1],
				subsection_link = drawer.find('iframe').attr('target'),
				dragger = $('div.dragger'),
				empty = $('<li class="message"><span>' + Symphony.Language.get('There are currently no items available. Perhaps you want create one first?') + '</li>'),
				textarea = $('textarea');
					
		/*-----------------------------------------------------------------------*/

			// Constructing
			stage.bind('constructstop', function(event, item) {
				
				// New item
				if(item.is('.new')) {
					create(item);
				}
			});
			
			// Destructing
			stage.bind('destructstart', function(event, item) {
			
				// Hide drawer
				item.next('li.drawer').slideUp('fast', function() {
					$(this).remove();
				});
			});
			
			// Synchronizing
			stage.bind('constructstop destructstop update', function(event) {
				sync();
			});
			
			// Queuing
			stage.delegate('li.preview a.file', 'click', function() {
				
				// Prevent clicks on links in queue
				return false;
			});
			
			// Editing
			if(!stage.is('.locked')) {
				selection.delegate('li:not(.new, .drawer, .empty, .message)', 'click', function(event) {
					var item = $(this),
						target = $(event.target),
						editor = item.next('.drawer');
					
					// Don't open editor for item that will be removed
					if(target.is('.destructor')) {
						return true;
					}
					
					// Open editor
					if(editor.size() == 0) {
						item.addClass('active');
						edit(item);
					}
					
					// Close editor
					else {
						item.removeClass('active');
						editor.slideUp('fast', function() {
							$(this).remove();
						});
					}
					
					// Don't follow links
					return false;
				});
			}
			
			// Updating
			stage.bind('edit', function(event, item, iframe) {
				var id = iframe.contents().find('form').attr('action').match(/\d+/g);

				// Fetch item id
				if($.isArray(id)) {
					id = id[id.length - 1];
				}

				// Update item
				update(id, item, iframe);
			});
					
			// Searching
			stage.bind('browsestart', function(event) {
				browse();
			});
			
			// Deleting
			stage.bind('erase', function(event, item) {
				erase(item);
			});
			
			// Dragging
			selection.delegate('.handle', 'mousedown.stage', function(event) {
				var handle = $(this);
				
				// Set class
				if(handle.parents('li').hasClass('preview')) {
					dragger.addClass('preview');	
				}
				else {
					dragger.removeClass('preview');
				}
			});
			
			// Dropping
			if(textarea.size() > 0) {
				if(!('drop' in textarea.data('events'))) {
					textarea.bind('drop.stage', function(event, item) {
						var target = $(this);
					
						// Insert text
						if(target.is('.droptarget')) {
							drop(target, item);
						}
					});
				}
			}
			
			// Sorting
			selection.bind('orderstart.stage', function() {
				selection.find('li.active').removeClass('active');
				selection.find('li.drawer').slideUp('fast', function() {
					$(this).remove();
				});
			});			
								
		/*-----------------------------------------------------------------------*/

			// Load subsection
			var load = function(item, editor, iframe) {
				var content = iframe.contents();
				
				// Handle Firefox flickering
				editor.css('overflow', 'hidden');

				// Adjust interface
				content.find('body').addClass('inline subsection');
				content.find('h1, h2, #nav, #notice:not(.error):not(.success), #notice a, #footer').remove();
				content.find('fieldset input:first').focus();
				
				// Frame resizing
				content.find('#contents').resize(function() {
					var height = $(this).height(),
						body = content.find('body');
					iframe.height(height);
					editor.animate({
						'height': height
					}, 'fast');
				});
			
				// Delete item
				if(item.is('.delete')) {
					
					// Remove queue item
					queue.find('li[data-value="' + item.attr('data-value') + '"]').slideUp('fast', function() {
						$(this).remove();
	
						// Show empty queue message
						if(queue.find('li').size() == 0) {
							empty.clone().appendTo(queue.find('ul')).slideDown('fast');
						}
					});
					
					// Remove item
					item.trigger('destruct');									
					stage.trigger('deletestop', [item]);
				}
				
				// Edit item
				else {			
				
					// Set height
					var height = content.find('#wrapper').outerHeight() || iframe.height();
					iframe.height(height).css('visibility', 'visible').animate({
						opacity: 1,
					}, 'fast');
					editor.animate({
						height: height
					}, 'fast');
					
					// Handle inline image preview
					if(content.find('body > img').width() > iframe.width()) {
					  content.find('body > img').css({
						'width': iframe.width()
					  });
					}
								
					// Fetch saving
					content.find('div.actions input').click(function() {
						iframe.animate({
							opacity: 0.01
						}, 'fast', function() {
							iframe.css('visibility', 'hidden');
						});
					});
					
					// Trigger update 
					if(content.find('#notice.success').size() > 0) {
						stage.trigger('edit', [item, iframe]);
					}
	
					// Trigger delete
					content.find('button.confirm').click(function(event) {
						event.stopPropagation();
						
						var message = Symphony.Language.get('Are you sure you want to delete {$item}? It will be removed from all entries. This step cannot be undone.', { 
							'item': item.find('span:first').text()
						});
						
						// Prepare deletion
						if(confirm(message)) {
							stage.trigger('deletestart', [item]);
							item.addClass('delete');
							
							// Hide iframe
							iframe.animate({
								opacity: 0.01
							}, 'fast');

							// Delete item
							return true;
						}
						
						// Stop deletion
						else {
							return false;
						}
					});
				}
			};
			
			// Browse queue
			var browse = function(async) {
				var list = queue.find('ul');

				// Append queue if it's not present yet
				if(queue_loaded == false && !list.is('.loading')) {
					list.addClass('loading');

					// Get queue items
					$.ajax({
						async: (async == true ? true : false),
						type: 'GET',
						dataType: 'html',
						url: Symphony.Context.get('root') + '/symphony/extension/subsectionmanager/get/',
						data: { 
							id: subsectionmanager_id, 
							section: subsection 
						},
						success: function(result) {

							// Empty queue
							if(!result) {
								empty.clone().appendTo(list);
							}
							
							// Append queue items
							else {
								$(result).appendTo(list);
								
								// Highlight selected items
								stage.trigger('update');
							}
							
							// Save status
							list.removeClass('loading');
							queue_loaded = true;
						}
					});
				}
			};
			
			// Create item
			var create = function(item) {
				stage.trigger('createstart', [item]);

				var editor = drawer.clone().hide().addClass('new');
				
				// Prepare iframe
				editor.find('iframe').css({
					'opacity': 0.01,
					'height': 0					
				}).attr('src', subsection_link + '/new/').load(function() {
					iframe = $(this);
					load(item, editor, iframe);
				});
				
				// Show subsection editor
				editor.insertAfter(item).slideDown('fast');			

				stage.trigger('createstop', [item]);
			};			
					
			// Edit item
			var edit = function(item) {
				stage.trigger('editstart', [item]);
							
				var editor = drawer.clone().hide();
				
				// Prepare iframe
				editor.find('iframe').css('opacity', '0.01').attr('src', subsection_link + '/edit/' + item.attr('data-value') + '/').load(function() {
					iframe = $(this);
					load(item, editor, iframe);
				});

				// Show subsection editor
				editor.insertAfter(item).slideDown('fast');			
		
				stage.trigger('editstop', [item]);
			};

			// Update item
			var update = function(id, item, iframe) {
				item.addClass('updating');
							
				// Load item data
				$.ajax({
					type: 'GET',
					url: Symphony.Context.get('root') + '/symphony/extension/subsectionmanager/get/',
					data: { 
						id: subsectionmanager_id, 
						section: subsection,
						entry: id
					},
					dataType: 'html',
					success: function(result) {
						var result = $(result),
							destructor = item.find('a.destructor').clone();

						// Get queue item
						var queue_item = queue.find('li[data-value="' + item.attr('data-value') + '"]');
						
						// Add preview class
						if(stage.is('.preview') && result.find('strong.file, img').size() > 0) {
							result.addClass('preview');
						}
						
						// New item
						if(queue_item.size() == 0) {
						
							// Update queue
							stage.find('div.queue ul').prepend(result.clone());
							
							// Update selected item
							item.children(':not(.destructor)').fadeOut('fast', function() {
								$(this).remove();
								result.children().hide().prependTo(item);
								item.attr('class', result.attr('class')).attr('data-value', result.attr('data-value')).children().fadeIn();
								stage.trigger('update');
							});
							
							// Remove empty queue message
							queue.find('li.message').remove();
						}
						
						// Existing item
						else {
							queue_item.html(result.html()).addClass(result.attr('class')).attr('data-value', result.attr('data-value'));
							item.html(result.html()).addClass(result.attr('class')).attr('data-value', result.attr('data-value')).append(destructor);
							stage.trigger('update');
						}				
					}
				});
			};
			
			// Synchronize lists
			var sync = function() {
				var stock = storage.find('option').removeAttr('selected');
								
				selection.find('li').not('.drawer').not('.new').not('.message').not('empty').each(function(index, item) {
					var item = $(item),
						id = item.attr('data-value'),
						stored = stock.filter('[value="' + id + '"]');

					// Existing item
					if(stored.size() == 1) {
						stored.attr('selected', 'selected');
					}
					
					// New item
					else {
						$('<option />').attr('selected', true).val(id).text(Symphony.Language.get('New item') + ' ' + id).appendTo(storage);
					}
				});
				
				// Activate Storage
				storage.removeAttr('disabled');
			};
			
			// Dropping items
			var drop = function(target, item) {
				var formatter = target.attr('class').match(/(?:markdown)|(?:textile)/) || ['html'],
					syntax = {
						markdown: {
							image: '![{@text}]({@path})',
							file: '[{@text}]({@path})'
						},
						textile: {
							image: '!{@path}({@text})!',
							file: '"{@text}":({@path})'
						},
						html: {
							image: '<img src="{@path}" alt="{@text}" />',
							file: '<a href="{@path}">{@text}</a>'
						}
					},
					text = item.attr('data-drop'),
					file, type, match, matches;
				
				// No custom drop text available
				if(!text) {
					text = $.trim(item.clone().find('a.destructor').remove().end().text());
					
					// Image or file
					if(item.find('a.file').size() != 0) {
					
						//
						file = item.find('a.file');				
						matches = {
							text: text,
							path: file.attr('href')
						};
	
						// Get type
						type = 'file';
						if(file.hasClass('image')) {
							type = 'image';
						}
						
						// Prepare text
						text = syntax[formatter.join()][type];
						for(match in matches) {
							text = text.replace('{@' + match + '}', matches[match]);
						}			
					}
				}
				
				// Replace text
				var start = target[0].selectionStart || 0;
				var end = target[0].selectionEnd || 0;
				var original = target.val();
				target.val(original.substring(0, start) + text + original.substring(end, original.length));
				target[0].selectionStart = start + text.length;
				target[0].selectionEnd = start + text.length;
			};
								
		/*-----------------------------------------------------------------------*/
			
			// Preload queue items asynchronously
			browse(true);
			
		});

	});
	
})(jQuery.noConflict());
