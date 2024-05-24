class TasksController < ApplicationController

    def today        
        @current_page = "today"
        if user_signed_in?
        @user = current_user
        @task = @user.tasks.build
        @tasks = @user.tasks.where(repeat: "today")
        @repeat = "today"
        end
    end
  
    def later
        @current_page = "later"
        if user_signed_in?
        @user = current_user
        @task = @user.tasks.build
        @tasks = @user.tasks.where(repeat: "once")    
        @repeat = "once"
        end
    end

    def everyday
        @current_page = "everyday"
        if user_signed_in?
        @user = current_user
        @task = @user.tasks.build
        @tasks = @user.tasks.where(repeat: "everyday") 
        @repeat = "everyday"
        end
    end

    def create
        @user = current_user
        @task = @user.tasks.build(task_params)
        if @task.save
            redirect_back_or_to root_path
        end
    end

    def update
        @task = Task.find_by id: params[:id]
        if @task.update(task_params)
            redirect_back_or_to root_path
        end
    end

    def destroy
        @task = Task.find_by id: params[:id]
            @task.destroy
            redirect_back_or_to root_path
    end

    def new_day        
        @user = current_user
        @arr = @user.tasks.where(repeat: "everyday") 
        @arr.each do |task|
            @user.tasks.build(title: task.title, repeat: "today").save
        end
        redirect_to :today 
    end

    private
    def task_params
        params.require(:task).permit(:title, :repeat)
    end
end
