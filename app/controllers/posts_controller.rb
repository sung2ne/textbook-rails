def index
  @q = Post.ransack(params[:q])
  @posts = @q.result(distinct: true)
               .includes(:user)
               .order(created_at: :desc)
               .page(params[:page]).per(10)
end