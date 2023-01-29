class UpdateController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        account = Account.find_by('email': session[:user_email])
        profile = Profile.find_by('email': session[:user_email])

        exists = !(account.nil?) && (!profile.nil?)

        if (exists)
            hasParams = 
                !(params[:password].nil?) &&
                !(params[:phone_number].nil?) &&
                !(params[:userType].nil?) &&
                !(params[:firstName].nil?) &&
                !(params[:lastName].nil?) &&
                !(params[:contact]) &&
                !(params[:currentCompany].nil?) &&
                !(params[:ctc].nil?) &&
                !(params[:currentRole].nil?) &&
                !(params[:experience].nil?) &&
                !(params[:skills].nil?) &&
                !(params[:address].nil?) &&
                !(params[:about].nil?) &&
                !(params[:profilePic].nil?) &&
                !(params[:resumeLink].nil?) &&
                !(params[:expectedSalary].nil?) &&
                !(params[:preferredLocation].nil?)

            account.update(
                "password": params[:password],
                "phone_number": params[:phone_number],
                "userType": params[:userType]
            )

            profile.update(
                "firstName": params[:firstName],
                "lastName": params[:lastName],
                "contact": params[:contact],
                "address": params[:address],
                "about": params[:about],
                "profilePic": params[:profilePic],
                "currentCompany": params[:currentCompany],
                "ctc": params[:ctc],
                "currentRole": params[:currentRole],
                "experience": params[:experience],
                "skills": params[:skills],
                "resumeLink": params[:resumeLink],
                "expectedSalary": params[:expectedSalary],
                "preferredLocation": params[:preferredLocation],
            )

            render json: { :success => true, :message => "Updated account & profile successfully." }
        else
            render json: { :success => false, :message => "Invalid EMail was passed in." }
        end
    end
end
