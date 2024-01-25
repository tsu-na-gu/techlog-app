class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @post = Post.find(params[id: :post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      redirect_to posts_path
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :post_id)
  end
end
