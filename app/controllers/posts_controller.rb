class PostsController < ApplicationController
  def index
    @category = Category.find(params[:category_id])
    if @category
      @posts = @category.posts
    else
      redirect_to '/'
    end
  end

  def new
    @post = Post.new
    @category = Category.find(params[:category_id])
  end

  def create
    @category = Category.find(params[:category_id])
    @post = Post.new(post_params)
    @post.category_id = @category.id
    if @post.save
      redirect_to @post
    else
      redirect_to 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @category = Category.find(@post.category_id)
    @post.destroy

    redirect_to category_posts_path(@category)
  end

  private
    def post_params
      params.require(:post).permit(:title, :body, :author)
    end

end
