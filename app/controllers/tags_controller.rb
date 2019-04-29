class TagsController < ApplicationController
  def each
    @id = params[:id].to_i
  end
end
