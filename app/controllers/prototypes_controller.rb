class PrototypesController < ApplicationController
  before_action :set_prototype, except: [:index, :new, :create]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @prototypes = Prototype.all
  end

  def new
    if user_signe_in?
    @prototype = Prototype.new
   else
    redirect_to new_user_session_path
   end

  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:image, :title, :catch_copy, :concept).merge(user_id: current_user.id)
  end
end
