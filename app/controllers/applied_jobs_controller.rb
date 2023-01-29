class AppliedJobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        profile = Profile.find_by('email': session[:user_email])
        applications = Application.where('userID': profile.id);

        jobs = []

        for application in applications do
            job = Job.find(application.jobID)

            jobs.append(job)
        end

        render json: jobs;
    end
end
