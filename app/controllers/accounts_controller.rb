class AccountsController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user == current_user
        redirect_to profile_path
    else
      @user_articles = @user.articles.page(params[:page]).per(3)
    end
  end
end