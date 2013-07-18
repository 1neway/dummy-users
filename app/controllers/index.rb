get '/' do
  # Look in app/views/index.erb
  session[""] = { value1: 'bro', value: 'bro2', value3: 'bro3' }
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
 if User.validate_login(params[:login][:email], params[:login][:password])

   @validation_status = true 
   session["email"] = params[:login][:email]

  redirect to '/secret' if @validation_status
 else

  erb :new_user
end
end

get '/secret' do
  erb :secret if session["email"]
end

get '/logout' do
  session["email"] = nil
end
