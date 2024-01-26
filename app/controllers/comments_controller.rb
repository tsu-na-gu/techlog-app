class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post

  def new
    @comment = @post.comments.build
  end
  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save!
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "コメントが作成されました" }
        format.turbo_stream { flash.now[:notice] = "コメントが作成されました" }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = @post.comments.find(params[:id])
  end

  def update
    @comment = @post.comments.find(params[:id])
    if @comment.update(comment_params)
      respond_to do |format|
        format.html { redirect_to posts_path, notice: "コメントが更新されました" }
        format.turbo_stream { flash.now[:notice] = "コメントが更新されました" }
      end
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])

    @comment.destroy

    respond_to do |format|
      format.html { redirect_to posts_path, notice: "コメントは削除されました" }
      format.turbo_stream { flash.now[:notice] = "コメントは削除されました" }
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post, :user)
  end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
