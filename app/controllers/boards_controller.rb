class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  
  def index
    @boards = Board.all
  end

  def show
  end

  def new
    @board = Board.new
  end

  def edit
  end

  def move_up
    board = Board.find(params[:board_id])
    #pri = Board.adjust(board)
    case board.priority
    when 2
      z = Board.find_by(priority: 1)
      z.update_attribute(:priority, 2)
      pri = 1
    when 3
      z = Board.find_by priority: 2
      z.update_attribute(:priority, 3)
      pri = 2
    when 4
      z = Board.find_by priority: 3
      z.update_attribute(:priority, 4)
      pri = 3
    when 5      
      z = Board.find_by priority: 4
      z.update_attribute(:priority, 5)
      pri = 4
    else
      pri = 1
    end
    board.update_attribute(:priority, pri)
    redirect_to boards_path
  end

  def move_down
    board = Board.find(params[:board_id])
    case board.priority
    when 1
      z = Board.find_by priority: 2
      z.update_attribute(:priority, 1)
      pri = 2
    when 2
      z = Board.find_by priority: 3
      z.update_attribute(:priority, 2)
      pri = 3
    when 3
      z = Board.find_by priority: 4 
      z.update_attribute(:priority, 3)
      pri = 4
    when 4
      z = Board.find_by priority: 5 
      z.update_attribute(:priority, 4)
      pri = 5
    else
      pri = 5
    end
    board.update_attribute(:priority, pri)
    redirect_to boards_path
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path
    else
      render :edit
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path
  end

  private

    def set_board
      @board = Board.find(params[:id])
    end

    def board_params
      params.require(:board).permit(:name, :priority, :move_up, :move_down)
    end
end
