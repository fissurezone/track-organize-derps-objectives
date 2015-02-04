class TasksController < ApplicationController
  def new
    @task = Task.new
  end
  def create
    @task = Task.create(task_params)
    @tasks = Task.all
  end
  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    @tasks = Task.all
  end
  def update
    @task = Task.find(params[:id])
    @task.update_attributes(status_params)
    @tasks = Task.all
  end
  private
  def task_params
    params.require(:task).permit(:title, :details)
  end
  def status_params
    params.permit(:title, :details, :status)
  end
end
