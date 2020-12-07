class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
 
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
    @comments = @post.comments.order(created_at: :desc)
  end

  def new
    @post = Post.new
  end
  
  def edit
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: '投稿完了しました！' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: '更新完了がしました！' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: '削除が成功しました！' }
      format.json { head :no_content }
    end
  end
  
  #def ensure_correct_user
   #@post = Post.find_by(id: params[:id])
    #if @post.user_id != current_user.id 
     #flash[:notice] = "権限がありません"
     #redirect_to("/posts")
    #end
  #end
  
  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :content)
    end
end
