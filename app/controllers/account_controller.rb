require 'bcrypt'

class AccountController < ApplicationController
    skip_before_action :verify_authenticity_token

    def update
        current_user = Account.find(params[:id])

        if (current_user.nil?)
            render json: { :success => false, :message => "User does not exist." }
        end

        current_user.update(
            'email': params[:email],
            'password': params[:password],
            'phone_number': params[:phone_number],
            'creationDate': params[:creationDate],
            'userType': params[:userType]
        )

        render json: { :success => true, :message => "Updated account successfully." }
    end

    def create
        Account.create(
            'email': params[:email],
            'password': params[:password],
            'phone_number': params[:phone_number],
            'creationDate': params[:creationDate],
            'userType': params[:userType]
        )

        render json: { :success => true }
    end

    def destroy
        user = Account.find(params[:id])
        user.destroy

        render json: { :success => true, :message => "Deleted the account successfully." }
    end
end
