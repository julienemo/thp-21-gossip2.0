class GossipsController < ApplicationController
  def new
  end

  def create
    id = User.last.id
    @gossip = Gossip.new(title: params[:title], user_id: id, content: params[:content])
    if @gossip.save
      flash[:success] = "Gossip created! Yours is the best!"
      redirect_to "/index"
    else
      flash[:danger] = "Creation failed. Did you check all the conditions?"
      render "new"
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @id = params[:id].to_i
  end
end
