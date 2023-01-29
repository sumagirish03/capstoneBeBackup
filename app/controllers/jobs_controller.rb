class JobsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: Job.all
    end

    def create
        Job.create(
            "jobTitle": params[:jobTitle],
            "jobDescription": params[:jobDescription],
            "companyName": params[:companyName],
            "location": params[:location],
            "jobType": params[:jobType],
            "salary": params[:salary],
            "postedDate": params[:postedDate],
            "skillsRequired": params[:skillsRequired],
            "domain": params[:domain],
            "jobCode": params[:jobCode],
            "applicationStatus": params[:applicationStatus]
        )

        render json: { :success => true, :message => "Job added successfully." }
    end

    def update
        job = Job.find(params[:id])

        job.update(
            'applicationStatus': params[:applicationStatus]
        )

        render json: { :success => true, :message => "Updated successfully." }
    end

    def destroy
        begin
            job = Job.find(params[:id])
        rescue => exception
            render json: { :success => false, :message => "User does not exist." }
            return
        end

        job.destroy

        render json: { :success => true, :message => "Deleted successfully." }
    end
end