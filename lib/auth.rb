get '/login' do
	@auth = Rack::Auth::Basic::Request.new(request.env)
  if @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == [MIKO_CONFIG['admin']['login'], MIKO_CONFIG['admin']['password']]
		session[:authorized] = true
		redirect '/'
	else
		session[:authorized] = false
		response['WWW-Authenticate'] = %(Basic realm="Miko Page Edit")
		throw(:halt, [401, "Not authorized\n"])
	end
end

get '/logout' do
	session[:authorized] = false
	redirect '/'
end

helpers do
	
	def authorized?
		session[:authorized]
	end

	def authorize!
		redirect '/login' unless authorized?
	end
	
end