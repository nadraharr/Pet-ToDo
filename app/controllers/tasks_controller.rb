class TasksController < ApplicationController

    def today
        @tasks = Task.where(today: true)
        @current_page = "today"
        @repeat = "once"
    end
  
    def later
        @tasks = Task.where(today: false)
        @current_page = "later"
        @repeat = "everyday"
    end

    def create
        @task = Task.new(task_params)
        if @task.today == true
            @task.save
            redirect_to "/today"
        else
            @task.save
            redirect_to "/later"
        end
    end

    def edit
        @task = Task.find_by id: params[:id]
    end

    def destroy
        @task = Task.find_by id: params[:id]
        if @task.today == true
            @task.destroy
            redirect_to "/today"
        else
            @task.destroy
            redirect_to "/later"
        end
    end

    private
    def task_params
        params.permit(:title, :today, :repeat)
    end
end
