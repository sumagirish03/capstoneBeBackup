class EligiblejobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        profile = Profile.find_by('email': session[:user_email])
        jobs = Job.all

        eligibleJobs = []
        
        for job in jobs do
            skillsMatched = true

            for skill in job.skillsRequired do
                if (!profile.skills.include?(skill.downcase))
                    skillsMatched = false
                end
            end

            if (skillsMatched)
                eligibleJobs.append(job)
            end
        end

        render json: eligibleJobs
    end
end