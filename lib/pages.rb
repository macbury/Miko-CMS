require "iconv"

get '/editor' do
	authorize!
	erb :editor
end

get '/*' do
	@dir = File.join([content_path, content_url])
	@static_dir = static_content_path
	
	unless File.directory?(@dir)
		if authorized?
			FileUtils.mkdir_p(@dir)
			redirect "/#{content_url}"
		else
			halt 404, "Page not found"
		end
	end
	
  erb :template
end

post '/*' do
	
end

helpers do
	def content_path
		File.join([File.dirname(__FILE__), '/.././content/page/'])
	end
	
	def static_content_path
		File.join([File.dirname(__FILE__), '/.././content/static/'])
	end
	
	def content_url
		params[:splat].to_s.split('/').map{ |route| escape(route) }.compact.join('/') #bug hack
	end
	
	def escape(string)
    result = Iconv.iconv("ascii//translit//IGNORE", "utf-8", string).to_s
    result.gsub!(/[^\x00-\x7F]+/, '') # Remove anything non-ASCII entirely (e.g. diacritics).
    result.gsub!(/[^\w_ \-]+/i,   '') # Remove unwanted chars.
    result.gsub!(/[ \-]+/i,      '-') # No more than one of the separator in a row.
    result.gsub!(/^\-|\-$/i,      '') # Remove leading/trailing separator.
    result.downcase!
    result.size.zero? ? nil : result
  end

	def content(name, solid=false)
		name = name.class == Symbol ? name.to_s : name
		name = escape(name)
		
		out = ""
		
		if authorized?
			out += '<div class="miko_block'
			out += " miko_solid" if solid
			out += '" rel="'+name+'">'
		end 
		
		content = ""
		
		file_name = solid ? File.join([@static_dir, "#{name}.html"]) : File.join([@dir, "#{name}.html"])
		
		f = File.exist?(file_name) ? File.open(file_name, 'r') : File.new(file_name, 'a+')
		f.each { |line| content += line }
		f.close
		
		content = "Click to enter text..." if content.empty?
		
		out += content
		out += '</div>'
		out
	end
end