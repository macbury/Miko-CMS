$(document).ready(function () {
	$('.miko_block').click(function () {
		var block = $(this);
		
		$('.miko_tiny_mce_editor').each(function () {
			$(this).tinymce().hide();
			$(this).parent('form').remove();
		});
		$('.miko_block').show();
		
		var editor_id = 'miko_block_'+block.attr('rel');
		block.hide().before('<form class="miko_reset" method="post"><input type="hidden"  name="block" value="'+block.attr('rel')+'" /><input type="hidden" name="solid" value="'+block.attr('solid')+'" /><textarea id="'+editor_id+'" class="miko_tiny_mce_editor" name="content"></textarea></form>');
		$('#'+editor_id).val(block.html());
		$('#'+editor_id).tinymce({
			width : $(block).parent().innerWidth(),
			script_url : '/miko_assets/tiny_mce/tiny_mce.js',
			theme : "advanced",
			plugins : "safari,pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",

			// Theme options
			theme_advanced_buttons1 : "save,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,",
			theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,",
			theme_advanced_buttons3 : "link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
			theme_advanced_buttons4 : "formatselect,fontsizeselect",
			theme_advanced_toolbar_location : "top",
			theme_advanced_toolbar_align : "left",
			theme_advanced_statusbar_location : "bottom",
			theme_advanced_resizing : true
		});
	});
});