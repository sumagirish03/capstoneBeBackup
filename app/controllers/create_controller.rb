class CreateController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        if (!session[:user_email].nil?)
            render json: { :success => false, :message => "Already logged in. Cannot create a new account." }
            return
        end

        hasParams = 
            !(params[:email].nil?) &&
            !(params[:password].nil?) &&
            !(params[:phone_number].nil?) &&
            !(params[:creationDate].nil?) &&
            !(params[:userType].nil?) &&
            !(params[:firstName].nil?) &&
            !(params[:lastName].nil?) &&
            !(params[:address].nil?) &&
            !(params[:about].nil?) &&
            !(params[:profilePic].nil?) &&
            !(params[:resumeLink].nil?) &&
            !(params[:expectedSalary].nil?) &&
            !(params[:preferredLocation].nil?)

        if (hasParams)
            current_user = Account.find_by('email': params[:email])

            if (!current_user.nil?)
                render json: { :success => false, :message => "EMail already in use. Please try a different EMail to create an account with." }
                return
            end

            Account.create(
                "email": params[:email],
                "password": params[:password],
                "phone_number": params[:phone_number],
                "creationDate": params[:creationDate],
                "userType": params[:userType]
            )

            Profile.create(
                "firstName": params[:firstName],
                "lastName": params[:lastName],
                "email": params[:email],
                "contact": params[:contact],
                "address": params[:address],
                "about": params[:about],
                "profilePic": params[:profilePic],
                "resumeLink": params[:resumeLink],
                "expectedSalary": params[:expectedSalary],
                "preferredLocation": params[:preferredLocation],
            )

            session[:user_email] = params[:email]

            render json: { :success => true, :message => "Created account & profile and LOGGED IN successfully." }
        else
            render json: { :success => false, :message => "Enough arguments not passed in." }
        end
    end
end
