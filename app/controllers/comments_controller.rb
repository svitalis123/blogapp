class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    respond_to do |format|
      format.html { render :new, locals: { comment: @comment } }
    end
  end

  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @user.comments.new(handle_params)
    @comment.user_id = @user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:success] = 'Succesfully created a comment'
      redirect_to user_post_path(@user.id, @post)
    else
      flash.new[:error] = 'encountered an error'
      render new, locals: { comment: @comment }
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = Post.find(params[:post_id])
    @post.CommentsCounter -= 1
    @comment.destroy!
    @post.save
    flash[:success] = 'successfuly deleted'
    redirect_to user_post_path(@post.user_id, @post.id)
  end

  def handle_params
    params.require(:my_comment).permit(:Text)
  end
end
