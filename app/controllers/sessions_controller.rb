class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Hey #{user.first_name}, how are you doing ?"
      redirect_to "/index"
    elsif not user
      flash[:danger] = "This email is not registered. Absolutely not."
      render '/users/new'
    else
      flash[:danger] = 'Naaa, incorrect password >< '
      render 'new'
    end
  end

  def destroy
    session.delete(:user_id)
    flash[:success] = 'You have safely logged out.'
    redirect_to "/index"
  end

end
