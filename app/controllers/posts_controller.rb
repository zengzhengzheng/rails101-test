class PostsController < ApplicationController

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group #对象赋予给对象，可以理解为@post.user_id = current_user.id 值赋予值id
    @post.user = current_user #对象赋予给对象，可以理解为@post.group_id = @group.id 值赋予值id

    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
  end

  def destroy
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to account_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:content)
  end
end
