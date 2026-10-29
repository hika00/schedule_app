class PostsController < ApplicationController
#一覧画面を表示
  def index
    @posts = Post.all
  end

#詳細画面を表示
  def show
    @post = Post.find(params[:id])
  end

#新規作成
  def new
    @post = Post.new
  end

#新規作成の保存
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

#編集
  def edit
    @post = Post.find(params[:id])
    render :edit
  end
#編集の保存
  def update
    @post = Post.find(params[:id])
    
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

#削除
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, :all_day)
  end