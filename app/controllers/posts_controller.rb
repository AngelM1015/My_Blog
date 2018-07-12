class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]
  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 7)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "You've created a post Angel, & it was successfully saved."
    else
      render 'new', notice: "Unable to save, sorry Angel"
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "The post has been modified Angel"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destory
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
