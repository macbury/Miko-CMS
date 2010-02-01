helpers do
	
	def head
		html = <<-eos
			<meta name="Description" content="Information architecture, Web Design, Web Standards" />
			<meta name="Keywords" content="your, keywords" />
			<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
			<meta name="Robots" content="index,follow" />
			<title>#{title}</title>
		eos
		
		if authorized?
			html += <<-eos 
				<link rel="stylesheet" type="text/css" href="/miko_assets/miko.css" />
				<link rel="stylesheet" type="text/css" href="/miko_assets/jquery-ui.css" />
				<link rel="stylesheet" type="text/css" href="/miko_assets/skins/simple/style.css" />
				<link rel="stylesheet" type="text/css" href="/miko_assets/sets/html/style.css" />
				<script src="/miko_assets/jquery.js" type="text/javascript" charset="utf-8"></script>
				<script src="/miko_assets/jquery-ui.js" type="text/javascript" charset="utf-8"></script>
				<script type="text/javascript" src="/miko_assets/sets/html/set.js"></script>
				<script src="/miko_assets/jquery.markitup.js" type="text/javascript" charset="utf-8"></script>
				
				<script src="/miko_assets/application.js" type="text/javascript" charset="utf-8"></script>
			eos
		end	
		html
	end
	
	def title
		MIKO_CONFIG['site']['title']
	end
	
end