class TasksController < ApplicationController
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!
  
    def index
      @tasks = current_user.tasks
    end
  
    def show
        @task = Task.find(params[:id])
    end
  
    def new
      @task = Task.new
      @categories = Category.all
    end
  
    def create
      @task = current_user.tasks.new(task_params)
  
      if @task.save
        redirect_to tasks_path, notice: 'Task was successfully created.'
      else
        @categories = Category.all
        render :new
      end
      # binding.b
    end
  
    def edit
      @categories = Category.all
    end
  
    def update
      @categories = Category.all
      if @task.update(task_params)
        redirect_to tasks_path, notice: 'Task was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @task.destroy
      redirect_to tasks_path, notice: 'Task was successfully destroyed.'
    end
  
    private
  
    def set_task
      @task = Task.find(params[:id])
    end
  
    def task_params
      params.require(:task).permit(:title, :description, :due_date, :category_id, :priority)
    end
  end