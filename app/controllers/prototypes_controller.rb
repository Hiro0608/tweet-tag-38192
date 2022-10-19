class PrototypesController < ApplicationController
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

  def show
    @comment = Comment.new
    @comments = @prototype.comments
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :place, :introduction, :image).merge(user_id: current_user.id)
  end
end
