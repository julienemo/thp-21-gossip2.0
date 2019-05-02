class SessionController < ApplicationController
  before_action :get_user
  def new
  end

  def create
  end

  def destroy
  end

  private
  def get_user
    @user = User.find(session[:user_id])
  end
end
