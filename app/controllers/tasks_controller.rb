class TasksController < ApplicationController
  
  before_action :set_list
  before_action :set_task, only: [:edit, :up, :down]
  
  def edit
  end

  def new
    @task = Task.new
  end

  def update
    @task = Task.new(task_params)
    if @task.save
      redirect_to boards_path
    else
      render :edit
    end
  end

  def up
    task = @list.tasks.find(params[:task_id])
    Task.adjust(task, 'up')
    redirect_to board_list_path(:board_id, @list)
  end

  def down
    task = @list.tasks.find(params[:task_id])
    Task.adjust(task, 'down')
    redirect_to board_list_path(:board_id, @list)
  end

  private

    def set_list
      @list = List.find(params[:list_id])
    end

    def set_task
      @task = Task.find(params[:task_id])
    end

    def task_params
      params.require(:task).permit(:name, :desc, :priority)
    end
end
