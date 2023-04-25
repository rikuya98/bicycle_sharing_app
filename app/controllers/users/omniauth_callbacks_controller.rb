class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def strava
    auth = request.env["omniauth.auth"]

    if current_user.present?
      current_user.update_strava_auth(auth)
      set_flash_message(:notice, :success, kind: "Strava") if is_navigational_format?
      redirect_to root_path, notice: 'Stravaとの連携が完了しました'
    else
      set_flash_message(:alert, :failure, kind: "Strava", reason: "ユーザー登録が必要です")
      redirect_to new_user_session_path
    end
  end



    def google_oauth2
      @user = User.from_omniauth(request.env['omniauth.auth'])

      if @user.persisted?
        sign_in @user, event: :authentication
        set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
      
        if @user.profile_completed?
          redirect_to root_path
        else
          redirect_to edit_profile_path
        end
      
      else
        session['devise.google_data'] = request.env['omniauth.auth'].except(:extra)
        redirect_to new_user_registration_url, alert: @user.errors.full_messages.join("\n")
      end
    end
end
