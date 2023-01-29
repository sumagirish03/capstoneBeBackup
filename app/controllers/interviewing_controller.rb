class InterviewingController < ApplicationController
    def index
        profile = Profile.find_by('email': session[:user_email])
        applications = Application.where('userID': profile.id)

        jobs = []

        for application in applications do
            job = Job.find(application.jobID)

            if (application.candidateApplicationStatus == 'interviewing')
                jobs.append(job)
            end
        end

        render json: jobs
    end
end