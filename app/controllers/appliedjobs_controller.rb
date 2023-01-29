class AppliedjobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        profile = Profile.find_by('email': session[:user_email])
        applications = Application.where('userID': profile.id)

        jobs = []

        for application in applications do
            job = Job.find(application.jobID)

            jobs.append(job)
        end

        render json: jobs
    end

    def create
        profile = Profile.find_by('email': session[:user_email])
        application = Application.new

        application.userID = profile.id

        application.jobID = params[:job][:jobID]
        application.jobCode = params[:job][:jobCode]
        application.location = params[:job][:location]

        application.appliedDate = params[:appliedDate]
        application.candidateApplicationStatus = params[:applicationStatus]

        application.save

        render json: { :success => true, :message => "Applied for job successfully." }
    end
end