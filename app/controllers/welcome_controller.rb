class WelcomeController < ApplicationController
  def show
    @id = params[:id]
  end
end
