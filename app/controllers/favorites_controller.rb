class FavoritesController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = @user.favorite_articles.page(params[:page]).per(3)
    end
end