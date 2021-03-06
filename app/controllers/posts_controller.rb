class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
    @post = Post.find_by(id: params[:id])
    if current_user.vip? || current_user.admin?
      @post.update(post_params)
    end
    redirect_to posts_path(@post)
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Post.find_by(id: params[:id])
  end
end
