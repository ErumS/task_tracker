class TasksController < ApplicationController
  def index
    ActiveRecord::Base.connected_to(role: :writing) do
      @tasks = Task.all
      p "task index", ActiveRecord::Base.connection_pool.db_config.name
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params.reject{|k| k=="category"}.merge({user: current_user}))
    p "task create", ActiveRecord::Base.connection_pool.db_config.name
    
    if @task.save!
      category = params[:task][:category]
      @task.categories.find_or_create_by!(name: category, resource_type: "Task")
      p "task create save", ActiveRecord::Base.connection_pool.db_config.name

        redirect_to tasks_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :description, :category)
  end
end