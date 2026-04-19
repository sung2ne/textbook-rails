def index
  @posts = Post.order(created_at: :desc).page(params[:page]).per(20)

  render json: {
    posts: @posts.map { |p| { id: p.id, title: p.title } },
    pagination: {
      current_page: @posts.current_page,
      total_pages:  @posts.total_pages,
      total_count:  @posts.total_count,
      per_page:     @posts.limit_value
    }
  }
end