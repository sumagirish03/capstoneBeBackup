require 'bcrypt'

class LoginController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def create
        current_user = Account.find_by('email': params[:email])

        if (current_user.nil?)
            render json: { :success => false, :message => "No such account with specified EMail." }
        else
            if (current_user.authenticate(params[:password]))
                session[:user_email] = current_user.email
                render json: { :success => true, :message => "Logged in successfully." }
            else
                render json: { :success => false, :message => "Incorrect password. Please try again." }
            end
        end
    end
end
