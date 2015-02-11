class CommentsController < ApplicationController
  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.commenter = current_user.name
    if @comment.save
      @comments = get_comments(@post)
      UserMailer.delay.send_incoming_comment(current_user,@comment)
    end
    respond_to do |format|
      format.js
    end
  end
  def destroy
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @comments = get_comments(@post)
    respond_to do |format|
      format.js
    end
  end
  private
  def comment_params
    params.require(:comment).permit(:body,:file_upload)
  end
  def get_comments(post)
    post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
end
