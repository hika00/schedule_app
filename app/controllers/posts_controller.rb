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
      redirect_to posts_path, notice: "予定を作成しました"
    else
      flash.now[:alert] = "予定の作成に失敗しました"
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
      redirect_to posts_path, notice: "予定を更新しました"
    else
      flash.now[:alert] = "予定の更新に失敗しました"
      render :edit, status: :unprocessable_entity
    end
  end

#削除
  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path, notice: "予定を削除しました"
    else
      redirect_to posts_path, alert: "予定の削除に失敗しました"
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :start_date, :end_date, :all_day)
  end
end