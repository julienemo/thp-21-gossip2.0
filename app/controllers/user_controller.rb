class UserController < ApplicationController
  def detail
    @id = params[:id].to_i
  end
end
