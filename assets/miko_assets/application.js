$(document).ready(function () {
	$('.miko_block').click(function () {
		var block = $(this);
		content = block.html();
		block.empty().append('<textarea>').val(content);
		
		$('textarea', block).val(content);
		$('textarea', block).ckeditor(function() {}, { 
			skin : 'v2',
			toolbar : [
			    ['Source','-','Save', '-', 'Cut','Copy','Paste','PasteText','PasteFromWord'],
			    ['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			    ['NumberedList','BulletedList','-','Outdent','Indent','Blockquote'],
			    ['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			    ['Link','Unlink','Anchor'],
			    ['Image','Flash','Table','HorizontalRule','SpecialChar','PageBreak'],
			    '/',
			    ['Styles','Format','Font','FontSize'],
			    ['TextColor','BGColor']
			],
		});
		
	});
});