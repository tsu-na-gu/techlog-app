class PostsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_post, only:[:edit, :update, :destroy]
  def index
    @posts = Post.all.ordered
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "投稿は新しく追加されました" }
        format.turbo_stream { flash.now[:notice] = "投稿は新しく追加されました" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "投稿が更新されました" }
        format.turbo_stream { flash.now[:notice] = "投稿が更新されました" }
      end
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿が削除されました"
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
