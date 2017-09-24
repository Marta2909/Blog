class CommentsController < ApplicationController

  def create
    @post = Post.find params[:post_id]
    @comment = @post.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Komentarz czeka na moderację"
      redirect_to post_path(@post.id)
    else
      flash[:notice] = "Formularz zawiera błędy"
      redirect_to post_path(@post.id)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:author, :body, :email, :comments_count)
  end

end
