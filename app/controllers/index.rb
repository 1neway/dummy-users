get '/' do
  # Look in app/views/index.erb
  erb :index
end

post '/new-user' do
  @user = User.create_login(params[:new][:name], params[:new][:email], params[:new][:password])
  @user
end

post '/' do
  p params[:login][:email]
  p params[:login][:password]
  @validation_status = nil
  @validation_status = true if User.validate_login(params[:login][:email], params[:login][:password])
  redirect to '/secret' if @validation_status
  erb :new_user
end

get '/secret' do
  erb :secret
end
