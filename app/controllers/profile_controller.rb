class ProfileController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        current_user = Profile.find_by('email': session[:user_email])

        if (current_user.nil?)
            render json: { :success => false, :message => "Profile does not exist." }
        else
            render json: current_user
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

    def destroy
        profile = Profile.find(params[:id])
        profile.destroy

        render json: { :success => true, :message => "Deleted profile successfully." }
    end
end
