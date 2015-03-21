class SessionsController < ApplicationController
  def create
    @user = User.find_or_create_by_auth_hash(auth_hash)
    session[:user_id] = @user.id
    # redirect_to '/'
    render text: auth_hash.inspect
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
