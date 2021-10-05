class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
     @blog = Blog.new
  end

  def create
     @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blog_path(@blog.id)
    else
    render :new #同じコントローラ内の別アクションのViewを表示する。この場合newアクション
    end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
    blog.update(blog_params)
    redirect_to blog_path(blog)#blog_pathは引数で,そのURLにHTTPリクエストを実行。8章redirect toの流れ
                               #この場合blogつまりshowアクションが実行され詳細画面に飛ぶ
  end

  def destroy
    blog = Blog.find(params[:id])
    blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :category, :body)
  end

end
