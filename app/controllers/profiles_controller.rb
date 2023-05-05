class ProfilesController < ApplicationController
    before_action :authenticate_user!

    def show
        @profile = current_user.profile
        @user = current_user
        @user_articles = @user.articles.page(params[:page]).per(3)
    end


    def edit
        @profile = current_user.prepare_profile
    end


  def update
    @profile = current_user.prepare_profile
    @profile.assign_attributes(profile_params)
    if @profile.save
      redirect_to profile_path, notice: 'プロフィール更新'
    else
      flash.now[:error] = '更新できませんでした'
      render :edit
    end
  end


    private

    def profile_params
        params.require(:profile).permit(
          :nickname,
          :bicycle_type,
          :genre,
          :introduction,
          :gender,
          :birthday,
          :subscribed, 
          :avatar
        )
    end
end