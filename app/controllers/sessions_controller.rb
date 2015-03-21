class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @user = User.find_or_create_by_auth_hash(auth_hash)
    @user.update_attributes(token: auth_hash.extra.access_token, token_secret: auth_hash.extra.access_token.secret)
    session[:user_id] = @user.id
    redirect_to '/swipe'
  end

  def demo
    # create a new demo user
    @user = User.create!
    session[:user_id] = @user.id
    redirect_to '/swipe'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
