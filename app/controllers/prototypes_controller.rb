class PrototypesController < ApplicationController
  before_action:authenticate_user!, only:[:new]
  before_action:move_to_index, only: [:edit,:update,:destroy]
 
  def new
    @prototype = Prototype.new
  end

  def create
    # ifぶんをしようしてじょうけんぶんきをしましょう
    # もしほぞんできたら

    @prototype = Prototype.new(prototype_params)
    if @prototype.save #createを変更する必要があります。saveを使用しましょう。
     redirect_to '/'
   else
      render :new
     # renderの後にどのhtml.erbを表示するかを追記しましょう。
    end
  end

  def index
    @prototype = Prototype.includes(:user)
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end
  
  def edit
    @prototype = Prototype.find(params[:id])
  end
  
  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
     redirect_to prototype_path
    else
      render :new
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
     @prototype.destroy
     redirect_to root_path
  end

  private
  def prototype_params
    params.require(:prototype).permit(:title, :image,:concept,:catch_copy ).merge(user_id: current_user.id)
    # ↑permitの中を修正しましょう。パラメーターで送られてきた値を書く必要があります。
  end

  def move_to_index
    @prototype = Prototype.find(params[:id])
    unless  user_signed_in? && current_user.id == @prototype.user_id 
      redirect_to action: :index
    end
  end

end