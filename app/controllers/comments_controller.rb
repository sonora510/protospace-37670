class CommentsController < ApplicationController

  def create
    #binding.pry
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to prototype_path(@comment.prototype)
    else
      @prototype = @comment.prototype
      @comments = @prototype.comments
      render "prototypes/show"
      #redirect_to prototype_path(@comment.prototype.id)
    end
  end

  def show
    @comment = Comment.all
  end

  private
  #binding.pry
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end