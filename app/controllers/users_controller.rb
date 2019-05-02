class UsersController < ApplicationController

  def show
    @id = params[:id].to_i
  end

  def new
  end

  def create
    user = User.new(first_name: params[:first_name].capitalize,
      city_id: City.last.id,
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation])
    if user.save
      session[:user_id] = user.id
      flash[:success] = "Welcome #{user.first_name}, you're now one of us!"
      redirect_to '/index'
    else
      flash[:danger] = "#{user.errors.messages.keys[0]} #{user.errors.messages.values[0][0]}"
      puts user.errors
      render "users/new"
    end
  end

  def edit
  end

  def update
    id = params[:id]
    user = User.find(id)
    puts "$"*60
    puts "ca bien du update"
    puts user
    if user.authenticate(params[:password])
        flash[:success] = "Profile updated."
        redirect_to "/index"
    else
        flash[:danger] = "Update failed"
        render "edit"
    end
  end
end
