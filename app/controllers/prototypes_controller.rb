class PrototypesController < ApplicationController
  #before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index,:new,:create,:show,]

  def index
    @prototypes = Prototype.includes(:user)
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    binding.pry
    unless user_signed_in? && current_user.id == @prototype.user_id
      redirect_to action: :index
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)

  end

  def update
    prototype = Prototype.find(params[:id])
    if prototype.update(prototype_params)
      redirect_to action: :show
    else
        render :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to action: :index
  end


  private
  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    # プロトタイプの投稿者とログインしているユーザーが同じであれば以下を表示する
    unless user_signed_in? && current_user.id == @prototype.user_id
      # user_signed_in?
      # user_signed_in? && current_user.id == @prototype.user_id
      # redirect_to "prototypes/#{comment.prototype.id}"
      redirect_to new_user_session_path
      # redirect_to action: :index
    end
  end
end
