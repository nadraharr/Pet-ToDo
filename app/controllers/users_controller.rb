class UsersController < ApplicationController

    def new
        @user = User.new
        @current_page = "signup"
    end

    def create
        @user = User.new(user_params)
        if @user.save
            sign_in(@user)
            redirect_to "/today"
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
