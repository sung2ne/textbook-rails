class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]

  # ... 다른 액션들 ...

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def correct_user
    unless @post.user == current_user
      redirect_to @post, alert: "권한이 없습니다."
    end
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end