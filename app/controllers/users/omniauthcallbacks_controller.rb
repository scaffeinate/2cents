class Users::OmniauthcallbacksController < ApplicationController
  def facebook
    authenticate_user(:facebook)
  end

  private
  def authenticate_user(provider)
    auth = request.env["omniauth.auth"]
  end

end
