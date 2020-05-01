class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show] 
  before_action :find_post ,only: [:edit, :update, :destroy] 
  
  def index
    if params[:user_search].blank?
      @posts = Post.with_attached_image.includes(:user).order(updated_at: :desc)
    else
      @posts = User.where(["username = ?", params[:user_search]]).first.posts.with_attached_image
    end
  end

  def search
    @posts = nil
    @posts = User.where(["username = ?", params[:user_search]]).first.posts.with_attached_image
    render 'index'
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end

