class CommentsController < ApplicationController

  def new
    render "_new"
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

  def index
    render "_index", locals:{comments: Comment.all}
  end

  def destroy
  end

  def update
  end

  private


end
