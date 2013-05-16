get '/sign_in' do 
  erb :user_sign_in
end

post '/sign_in' do
  @user = User.authenticate(params[:email], params[:password])
  erb :show_all
end

get '/sign_up' do
  erb :user_sign_up
end

post '/sign_up' do
  @user = User.new(params)
  if @user.save
    session[:user_id] = @user.id
    erb :show_all
  else
    @errors = @user.errors
    redirect to '/'
  end
end

