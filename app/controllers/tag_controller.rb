post '/add_tag' do
  @tag = Tag.find_or_create_by_name(params[:tag_name])
  @tagging = Tagging.new(:post_id => params[:post_id], :tag_id => @tag.id)
  if @tagging.save
    redirect "/show/#{params[:post_id]}"
  else
    @errors = @tagging.errors
    redirect back
  end
end


