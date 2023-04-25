class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def strava
      @user = User.from_omniauth(request.env["omniauth.auth"])
  

      if @user.persisted?
        sign_in_and_redirect @user, event: :authentication
        set_flash_message(:notice, :success, kind: "Strava") if is_navigational_format?
      else
        session["devise.strava_data"] = request.env["omniauth.auth"]
        redirect_to new_user_registration_url
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
