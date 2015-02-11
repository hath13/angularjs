class PostsController < ApplicationController
  def index
    @posts = current_user.posts.all.paginate(page: params[:page], per_page: 15)
  end
  def new
    @post = current_user.posts.new
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash[:danger] = ""
      render 'new'
    end
  end
  def edit
    @post = current_user.posts.find(params[:id])
  end
  def update
    @post = current_user.posts.find(params[:id])
    if(@post.update_attributes(post_params))
      redirect_to posts_path
    else
      render 'edit'
    end
  end
  def show
    @post = current_user.posts.find(params[:id])
    @comments = @post.comments.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end
  def destroy
    @post = current_user.posts.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    else
      redirect_to @post
    end
  end
  private
  def post_params
    params.require(:post).permit(:title,:text)
  end
end
