helpers do
	
	# Insert head tags for miko cms
	
	def head
		html = <<-eos
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="Robots" content="index,follow" />
		eos
		
		if authorized?
			html += <<-eos 
				<link rel="stylesheet" type="text/css" href="/miko_assets/miko.css" />
				<script src="/miko_assets/jquery.js" type="text/javascript" charset="utf-8"></script>
				<script src="/miko_assets/tiny_mce/tiny_mce.js" type="text/javascript" charset="utf-8"></script>
				<script src="/miko_assets/tiny_mce/jquery.tinymce.js" type="text/javascript" charset="utf-8"></script>
				<script src="/miko_assets/application.js" type="text/javascript" charset="utf-8"></script>
			eos
		end	
		html
	end
	
end