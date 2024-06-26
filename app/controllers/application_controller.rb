class ApplicationController < ActionController::Base

    private
    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id].present?
    end

    def user_signed_in?
        current_user.present?
    end

    def sign_in(user) 
        session[:user_id] = user.id
    end

    def sign_out
        session.delete :user_id
    end

    helper_method :current_user, :user_signed_in?
end
