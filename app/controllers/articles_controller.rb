class ArticlesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
    def index
        @articles = Article.all
    end
    def search
        @articles = Article.search(params)
        render :search
    end

    def new
        @article = current_user.articles.build
    if current_user.strava_token.present?
        strava_service = StravaService.new(current_user.strava_token)
        @strava_activites = strava_service.fetch_activities
    else
        @strava_activites = []
    end
    end

    def show
        @article = Article.find(params[:id])
        @comment = Comment.new
        @comments = @article.comments.order(created_at: :desc)


        if @article.activity_id.present?
            strava_service = StravaService.new(current_user&.strava_token)
            @strava_activity = strava_service.fetch_activity(@article.activity_id)
        end
        # if current_user.strava_token.present?
        #     strava_service = StravaService.new(current_user.strava_token)
        #     @strava_activity = strava_service.fetch_activity(@article.activity_id)
        # # end
        # strava_service = StravaService.new(current_user&.strava_token)
        # @strava_activity = strava_service.fetch_activity(@article.activity_id) if @article.activity_id.present?

    end

    def create
        @article = current_user.articles.build(article_params)
        if @article.save
          redirect_to article_path(@article), notice: '記事が投稿されました'
        else
          flash.now[:error] = '記事が投稿できませんでした'
          render :new
        end
    end

    def edit
        @article = current_user.articles.find(params[:id])
        if current_user.strava_token.present?
            strava_service = StravaService.new(current_user.strava_token)
            @strava_activites = strava_service.fetch_activities
        else
            @strava_activites = []
        end
    end

    def update
        @article = current_user.articles.find(params[:id])
        if @article.update(article_params)
            redirect_to article_path(@article), notice: '更新できました'
        else
            flash.now[:error] = '更新できませんでした'
            render :edit
        end
    end

    def destroy
        article = current_user.articles.find(params[:id])
        article.destroy!
        redirect_to root_path, notice: '記事が削除されました'
    end

    private

    def article_params
        params.require(:article).permit(:title, :content, :prefecture_id, :activity_id, images: [], tag_ids: [])
    end
end