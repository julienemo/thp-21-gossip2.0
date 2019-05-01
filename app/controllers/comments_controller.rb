class CommentsController < ApplicationController
  before_action :get_comment_id, :get_gossip_id

  def new
    render "_new"
  end

  def edit
  end

  def create
    comment = Comment.new(author_id: User.last.id, gossip_id: params[:gossip_id], content: params[:c_content])
    if comment.save
      flash[:success] = "Comment created"
    else
      flash[:danger] = "Comment failed. Please try again."
    end
    redirect_back fallback_location: @gossip
  end

  def destroy
    Comment.find(@id).destroy
    flash[:success] = "Comment deleted."
    redirect_to gossip_path(@gossip_id)
  end

  def update
    comment = Comment.find(@id).update(author_id: User.last.id, gossip_id: params[:gossip_id], content: params[:c_content])
    if comment
      flash[:success] = "Comment update."
    else
      flash[:danger] = "Comment failed. Please try again."
    end
    redirect_to gossip_path(@gossip_id)

  end

  private
  def get_comment_id
    @id = params[:id].to_i
  end

  def get_gossip_id
    @gossip_id = params[:gossip_id].to_i
  end
end
