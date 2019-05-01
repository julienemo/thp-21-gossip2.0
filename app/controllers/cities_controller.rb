class CitiesController < ApplicationController
  def show
    @id = params[:id].to_i
  end
end
