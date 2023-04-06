class FavoritesController < ApplicationController
    def show
        @user = User.find(params[:id])
        @articles = @user.favorite_articles
    end
end