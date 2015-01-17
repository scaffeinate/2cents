class Users::OmniauthCallbacksController < ApplicationController
  def facebook
    authenticate_user(:facebook)
  end

  def google_oauth2
    authenticate_user(:google)
  end

  private
  def authenticate_user(provider)
    auth = request.env["omniauth.auth"]
    @user = User.from_omniauth(auth)
    @user.skip_confirmation!
    @user.save
    if @user.persisted?
      sign_in(:user, @user)
      redirect_to root_url
    else
      redirect_to new_user_registration_url
    end
  end
end
