class LogoutController < ApplicationController
    def index
        session.delete(:user_email)

        render json: { :success => true, :message => "Logged out successfully." }
    end
end
