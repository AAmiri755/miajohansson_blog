class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_any!, except: [:index, :show]

  def authenticate_any!
    if admin_signed_in?
        authenticate_admin!
    else
        authenticate_user!
    end
  end

  def index
    @posts = Post.all.order("created_at desc").paginate(page: params[:page], per_page: 7)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new post_params

    if @post.save
      redirect_to @post, notice: "Congrats! Your post was successfully published on The Teen Magazine!"
    else
      render 'new', notice: "Oh no! Your post was not able to be saved!"
    end
  end

  def show
    set_meta_tags title: @post.title,
                  description: @post.meta_description,
                  keywords: @post.keywords
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to @post, notice: "Boo-Yah! Your article was saved!"
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :content, :image, :category, :meta_title, :meta_description, :keywords, :user_id, :slug)
  end

  def find_post
    @post = Post.friendly.find(params[:id])
  end
end
