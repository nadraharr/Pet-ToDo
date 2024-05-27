class PagesController < ApplicationController
    before_action :set_task
    
    def today        
        @repeat = "today"
        @tasks = current_user.tasks.where(repeat: @repeat) if user_signed_in?
    end
  
    def later 
        @repeat = "once"
        @tasks = current_user.tasks.where(repeat: @repeat) if user_signed_in?
    end

    def everyday
        @repeat = "everyday"
        @tasks = current_user.tasks.where(repeat: @repeat) if user_signed_in?
    end

    private
    def set_task        
        @task = current_user.tasks.build if user_signed_in?
    end
end
