var funcNum;
var urlNew;

if (typeof Symphony == "undefined") {
	var Symphony = {};
}
if (typeof Symphony.WEBSITE == "undefined") {
	Symphony.WEBSITE = window.location.toString().match(/^(.+?)\/symphony/)[1];
}
if (typeof Symphony.ADMIN == "undefined") {
	Symphony.ADMIN = Symphony.WEBSITE + "/symphony";
}

$(function(){
	funcNum = getUrlParam('CKEditorFuncNum');

	$("div.left a").click(function(){
		$("div.left a").removeClass("active");
		$(this).addClass("active");
		loadRightPanel(Symphony.ADMIN + "/extension/ckeditor/filebrowserajax/?id=" + $(this).attr("id"));
		return false;
	});
	
	// Default: activate the first category:
	$("div.left a:first").click();
});

function loadRightPanel(url)
{
	$("div.right").load(url/*+ " form>*"*/, function(){
		// some magic mumbo jumbo:
		// Hover on the table rows:
		$("div.right tr").hover(function(){
			$(this).addClass("hover");
		}, function(){
			$(this).removeClass("hover");
		}).click(function(){
			// If the row is clicked, the first anchor is selected. This is because an entry could also have multiple files
			$("a:first", this).click();
		});
		// Click on an anchor
		$("a", $("div.items")).click(function(){
			// Send URL to CKEditor:
			window.opener.CKEDITOR.tools.callFunction(funcNum, $(this).attr("href"));
			window.close();
			return false;
		});
		// Create new-functionality:
		$("a.create").click(function(){
			urlNew = $(this).attr("href");
			$.get(urlNew, function(data){
				buildForm(data);
			});
			return false;
		});
	});
}

function buildForm(data)
{
	$("div.right").html('<form method="post" action="' + urlNew + '"></form>');
	$("div.field", data).each(function(){
		$("div.right form").append('<div class="field">' + $(this).html() + '</div>');
	});
	$("div.right form").append('<input type="button" name="cancel" value="Cancel" />');
	$("div.right form").append('<input type="submit" name="action[save]" value="Submit" />');
	$("input[name='cancel']").click(function(){
		loadRightPanel(Symphony.ADMIN + "/extension/ckeditor/filebrowserajax/?id=" + $("div.left a.active").attr("id"));
	});
	// Ajax form:
	$("div.right form").ajaxForm({
		success: function(responseText, statusText, xhr)
		{
			if($("p.error", responseText).length > 0)
			{
				// Reload the form:
				buildForm(responseText);
			} else {
				// No error found! Content stored!
				loadRightPanel(Symphony.ADMIN + "/extension/ckeditor/filebrowserajax/?id=" + $("div.left a.active").attr("id"));
			}		
		}
	});
}

// Helper function to get parameters from the query string.
function getUrlParam(paramName)
{
	var reParam = new RegExp('(?:[\?&]|&amp;)' + paramName + '=([^&]+)', 'i') ;
	var match = window.location.search.match(reParam) ;
	return (match && match.length > 1) ? match[1] : '' ;
}