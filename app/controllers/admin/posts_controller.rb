class Admin::PostsController < Admin::AdminController
  before_action :set_post, only: [:edit, :update, :destroy]

  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to  @post, success: 'Статья успешно создана'
    else
      flash.now[:danger] = 'Не удалось создать статью'
      render :new
    end
  end
  def edit
  end
  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Статья успешно отредактирована'
    else
      flash.now[:danger] = 'Не удалось отредактировать статью'
      render :edit
    end
  end
  def destroy
    @post.destroy
    redirect_to posts_path, success: 'Статья успешно удалена'
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end
  def post_params
    params.require(:post).permit(:title, :decription, :body, :image, :all_tags, :category_id)
  end
end