class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]
   before_action :authenticate_user!, except: [:index, :new, :create ]
  # GET /articles
  # GET /articles.json
  def index
    @articles = Article.all
     session[:list] = nil
    # raise session.inspect
  end

  # GET /articles/1
  # GET /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new

  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles
  # POST /articles.json
  def create

    # Check to see if the user is registered/logged in
 # if current_user.nil?
     # Store the form data in the session so we can retrieve it after login
  #  session[:list] = params
     # Redirect the user to register/login
  #   redirect_to new_user_registration_path 

 # else   
    

    @article = current_user.articles.new(article_params)

    #raise @article.to_yaml
     # @article = Article.new(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to @article, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
 # end  
  end

  # PATCH/PUT /articles/1
  # PATCH/PUT /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1
  # DELETE /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:article).permit(:title, :author, :description, :image,
       article_photos_attributes: [:article_id, :id, :image])
    end
end



