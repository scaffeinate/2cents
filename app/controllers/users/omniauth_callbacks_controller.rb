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
    user = User.find_for_oauth(auth)
    authentication = Authentication.from_omniauth(auth, user)
    sign_in(user)
    redirect_to root_url
  end
end
