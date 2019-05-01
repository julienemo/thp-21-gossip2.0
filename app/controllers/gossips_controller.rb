class GossipsController < ApplicationController
  before_action :get_id

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
    @gossip = Gossip.find(@id)
    if @gossip.update(title: params[:title], content: params[:content])
      flash[:success] = "Gossip updated! Thank you for setting things right!"

      # or redirect_to "/gossips/blablabla"
      redirect_to gossip_path(@id)
    else
      flash[:danger] = "Update failed. Did you check all the conditions?"
      render "edit"
    end
  end

  def edit
    @gossip = Gossip.find(@id)
  end

  def destroy
    Gossip.find(@id).destroy
    flash[:success] = "Gossip #{@id} deleted."
    redirect_to "/index"
  end

  def show
  end

  private

  def get_id
    @id = params[:id].to_i
  end
end
