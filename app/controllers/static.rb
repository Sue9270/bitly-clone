

get '/' do
  # let user create new short URL, display a list of shortened URLs
  @new_url = Url.last   
  erb :"static/index"
end



# i.e. /q6bda
get '/:short_url' do
  # redirect to appropriate "long" URL
  x = Url.find_by(short_url: params[:short_url])    
  x.save
  redirect  x.long_url
end

post '/long_url' do
  @new_url = Url.new(long_url: params[:long_url])
  if @new_url.save
    return @new_url.to_json
  else
    
    return @new_url.errors.full_messages.join('. ')
  end
end

