def create
  @post = Post.new(post_params)
  # params[:post][:title] => "JSON 제목"
end