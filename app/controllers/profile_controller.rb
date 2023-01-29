class ProfileController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        profile = Profile.find_by('email': session[:user_email])
        account = Account.find_by('email': session[:user_email])

        if (profile.nil?)
            render json: { :success => false, :message => "Profile does not exist." }
        else
            render json: { :profile => profile, :account => account, :success => true }
        end
    end

    def create
        Profile.create(
            "firstName": params[:firstName],
            "lastName": params[:lastName],
            "email": params[:email],
            "contact": params[:contact],
            "address": params[:address],
            "about": params[:about],
            "profilePic": params[:profilePic],
            "currentCompany": params[:currentCompany],
            "ctc": params[:ctc],
            "currentRole": params[:currentRole],
            "experience": params[:experience],
            "resumeLink": params[:resumeLink],
            "expectedSalary": params[:expectedSalary],
            "preferredLocation": params[:preferredLocation]
        )

        render json: { :success => true, :message => "Profile created successfully." }
    end

    def update
        profile = Profile.find(params[:id])

        profile.update(
            "firstName": params[:firstName],
            "lastName": params[:lastName],
            "email": params[:email],
            "contact": params[:contact],
            "address": params[:address],
            "about": params[:about],
            "profilePic": params[:profilePic],
            "currentCompany": params[:currentCompany],
            "ctc": params[:ctc],
            "currentRole": params[:currentRole],
            "experience": params[:experience],
            "resumeLink": params[:resumeLink],
            "expectedSalary": params[:expectedSalary],
            "preferredLocation": params[:preferredLocation]
        )

        render json: { :success => true, :message => "Profile updated successfully." }
    end
end
