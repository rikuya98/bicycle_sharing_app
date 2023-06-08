class AccountsController < ApplicationController

  def show
    @user = User.find(params[:id])
    if @user == current_user
        redirect_to profile_path
    else
      # 3はマジックナンバーになるので定数で用意した方が良いかもです！
      # マジックナンバーとは(https://e-words.jp/w/%E3%83%9E%E3%82%B8%E3%83%83%E3%82%AF%E3%83%8A%E3%83%B3%E3%83%90%E3%83%BC.html)
      # PER = 3
      # @user_articles = @user.articles.page(params[:page]).per(PER)
      @user_articles = @user.articles.page(params[:page]).per(3)
    end
  end
end