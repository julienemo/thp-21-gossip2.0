class UsersController < ApplicationController

   skip_before_action :verify_authenticity_token

  def show
    @id = params[:id].to_i
  end

  def new
  end

  def create
    puts params
    user = User.new(first_name: params[:first_name],city_id: City.last.id, email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation] )
    if user.save
      flash[:success] = "Welcome #{params[:first_name]}, you're now one of us!"
      redirect_to '/index'
    else
      flash[:danger] = "#{user.errors.messages.keys[0]} #{user.errors.messages.values[0][0]}"
      puts user.errors
      render "users/new"
    end
  end
end
