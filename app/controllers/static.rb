get '/' do
  erb :"static/index"
end

get '/about' do 
	erb :"static/about"
end 

post '/create_url' do 
	puts "++++++++++++++++++++"
	puts params 
	puts "++++++++++++++++++++"
	x = Url.new(long_url: params[:long_url])

	if x.save 
		# redirect "/"
		x.to_json
	else 
		@errors = x.errors.messages
		p "+++++++++++++++++++++++++++++"
		p @errors
		p "+++++++++++++++++++++++++++"
 		erb :"static/index"
	end 
end 

get '/:short_url' do
	c = true 
	para = params[:short_url]
	a = Url.find_by(short_url: para)
	aaa = a.long_url
	if c == true 
		b = a.url_click_count
		a.update(url_click_count: b + 1)
	end 
	redirect aaa 

	# redirect to the original link 
end 