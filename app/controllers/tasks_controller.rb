class TasksController < ApplicationController

    def today        
        @current_page = "today"
        if user_signed_in?
        @user = current_user
        @task = @user.tasks.build
        @tasks = @user.tasks.where(today: true)
        @today = true
        @repeat = "once"
        end
    end
  
    def later
        @current_page = "later"
        if user_signed_in?
        @user = current_user
        @task = @user.tasks.build
        @tasks = @user.tasks.where(today: false)        
        @today = false
        @repeat = "everyday"
        end
    end

    def create
        @user = current_user
        @task = @user.tasks.build(task_params)
        if @task.today == true
            @task.save
            redirect_to "/today"
        else
            @task.save
            redirect_to "/later"
        end
    end

    def update
        @task = Task.find_by id: params[:id]
        if @task.update(task_params)
         @task.today ? (redirect_to "/today") : (redirect_to "/later")
        end
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
        params.require(:task).permit(:title, :today, :repeat)
    end
end
