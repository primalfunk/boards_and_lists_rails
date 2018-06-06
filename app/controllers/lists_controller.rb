class ListsController < ApplicationController
  before_action :set_board, only: [:new, :edit, :create]
  before_action :set_list, only: [:edit, :show, :update, :destroy]

  def move_up
    @board = Board.find(params[:id])
    list = @board.lists.find(params[:list_id])
    List.adjust(list, 'up')
    redirect_to boards_path
  end

  def move_down
    @board = Board.find(params[:id])
    list = @board.lists.find(params[:list_id])
    List.adjust(list, 'down')
    redirect_to boards_path
  end
    
  def new
    @list = @board.lists.new
  end

  def edit
  end

  def show
  end

  def create
    @list = @board.lists.new(list_params)
    if @list.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    if @list.update(list_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  private
    def set_board
      @board = Board.find(params[:board_id])
    end

    def list_params
      params.require(:list).permit(:name, :desc, :priority)
    end

    def set_list
      @list = @board.lists.find(params[:id])
    end
end
