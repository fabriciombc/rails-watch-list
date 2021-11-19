class ListsController < ApplicationController
  # Get all the lists and show to user
  def index
    @lists = List.all
  end

  # GET / Mostrar lISta especifica
  def show
    @list = List.find(params[:id])
  end

  #GET / criando uma nova lista
  def new
    @list = List.new
  end

  #POST / dando um push na lista criada em new
  def create
    @list = List.new(list_params)
    if @list.save
      redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def list_params #permisao que o usuario coloque apenas :name
    params.require(:list).permit(:name)
  end
end
