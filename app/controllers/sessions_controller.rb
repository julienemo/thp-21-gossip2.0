class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Hey #{user.first_name}, how are you doing ?"
      redirect_to "/index"
    else
      flash.now[:danger] = 'Naaa, incorrect email or password >< '
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
  end

end
