class TasksController < ApplicationController
    def create
        @task = current_user.tasks.build task_params
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
        @arr = current_user.tasks.where(repeat: "everyday") 
        @arr.each do |task|
            current_user.tasks.build(title: task.title, repeat: "today").save
        end
        redirect_to :today 
    end

    private
    def task_params
        params.require(:task).permit(:title, :repeat)
    end
end
