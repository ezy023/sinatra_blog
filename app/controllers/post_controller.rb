get '/create_post' do 
  erb :create_post
end

post '/create_post' do
	@post = Post.new(:title => params[:title], :content => params[:content], user_id => current_user.id)
  if @post.save
    redirect to "/show/#{@post.id}"
  else
    @errors = @post.errors
    erb :index
  end
end

get '/show_all' do
  @all_posts = Post.all
  erb :all_user_posts
end

get '/show/:post_id' do
  @post = Post.find_by_id(params[:post_id])
  erb :show_post
end

post '/delete_post' do 
  Post.find_by_id(params[:post_id]).destroy
  redirect to '/show_all'
end

get '/edit_post/:post_id' do 
  @post = Post.find_by_id(params[:post_id])
  erb :edit_post
end

post '/edit_post' do 
  @post = Post.find_by_id(params[:post_id])
  @post.update_attributes(:content => params[:content])
  redirect to "/show/#{@post.id}"
end
