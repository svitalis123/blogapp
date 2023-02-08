class LikesController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @post = Post.find(params[:post_id])
    @likes = Like.new(user_id: @user.id, post_id: params[:post_id])
    if @likes.save
      @post.increment!(:LikesCounter)
      redirect_to user_posts_path(@user, @post)
    else
      flash.now[:error] = 'comment not added'
      @likes.errors.full_messages.join(', ')
    end
  end
end
