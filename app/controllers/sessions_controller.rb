class SessionsController < ApplicationController
  def create
    session[:user_hash] = auth_hash
    # redirect_to '/'
    render text: auth_hash.inspect
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
