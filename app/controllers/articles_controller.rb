class ArticlesController < ApplicationController
  before_action :set_article, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @articles = Article.paginate(page: params[:page], per_page: 4)

  end

  def new
    @article = Article.new
  end

  def edit

  end

  def create
    #render plain: params[:article].inspect

    @article = Article.new(article_params)


    if @article.save
      flash[:success] = "article was successfully created"
      redirect_to article_path(@article)

    else

      render :new
    end
  end

  def update


    if @article.update(article_params)
      flash[:success] = "Article was updated"
      redirect_to edit_article_path(@article)
    else
      render :edit
    end
  end

  def show

  end

  def destroy

    @article.destroy

    redirect_to articles_path
    flash[:danger] = "Article deleted"
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end


  def article_params
    params.require(:article).permit(:title, :description, :user_id)
  end

  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:danger] = "you can only edit your own articles"
      redirect_to root_path
    end

  end

end