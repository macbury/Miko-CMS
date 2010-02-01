$(document).ready(function () {
	$('body').append('<div id="miko_editor"></div>');
	
	$('#miko_editor').append('<textarea id="miko_html_editor" cols="80" rows="20">');
	
	$('#miko_editor').dialog({
		title: "Edit Block",
		bgiframe: true,
		modal: true,
		autoOpen: false,
		width: 720,
		height: 450,
		resizable: false,
		buttons: {
			Save: function() {
				$(this).dialog('close');
				$.ajax();
			},
			Cancel: function() {
				$(this).dialog('close');
			}
		}
	});
	
	
	$('.miko_block').click(function () {
		$('#miko_html_editor').val($(this).html());
		$('#miko_editor').dialog('open');
	});
	
	$('#miko_html_editor').markItUp(mySettings);
});