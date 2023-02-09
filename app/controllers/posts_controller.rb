class PostsController < ApplicationController
  load_and_authorize_resource
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments)
  end

  def new
    @post = Post.new
    respond_to do |format|
      format.html { render :new, locals: { post: @post } }
    end
  end

  def create
    current_user = User.find(params[:user_id])
    @post = Post.new(helper_params)
    @post.user_id = current_user.id
    @post.CommentsCounter = 0
    @post.LikesCounter = 0
    if @post.save
      flash[:success] = 'Added succesfully'
      redirect_to user_posts_path(current_user)
    else
      flash.now[:error] = 'question could not  be saved'
      render :new, locals: { post: @post }
    end
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.where(user_id: @user.id)
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    user = User.find(params[:user_id])
    user.PostsCounter -= 1
    @post.destroy!
    user.save
    flash[:success] = 'You have deleted this post!'
    redirect_to user_posts_path(user.id)
  end

  private

  def helper_params
    params.require(:my_post).permit(:Title, :Text)
  end
end
