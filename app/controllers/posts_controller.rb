class PostsController < ApplicationController
  
  
  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true)
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def new
    @post = Post.new
    @category = Category.all
  end
  
  def create
    @post = Post.new(params.require(:post).permit(:title,:body,:category_id,:author_id, :link, :downbody, :img))
    if @post.save
      redirect_to posts_path, :notice => "Your post have been saved"
    else
      render "New"
    end
  end
  
  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(params[:post].permit(:title,:body,:category_id,:author_id, :link, :downbody, :img))
      redirect_to post_path, :notice => "Your post has been updated"
    else
      render "edit"
    end
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path, :notice => "Your post has been deleted"
  end
  
end
