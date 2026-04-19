def create
  @post = Post.find(params[:post_id])
  @comment = @post.comments.build(comment_params)

  if @comment.save
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @post }
    end
  else
    respond_to do |format|
      format.turbo_stream {
        render turbo_stream: turbo_stream.replace("new_comment_form") {
          render partial: "comments/form",
                 locals: { post: @post, comment: @comment }
        }
      }
      format.html { redirect_to @post, alert: @comment.errors.full_messages.join(", ") }
    end
  end
end