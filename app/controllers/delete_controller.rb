class DeleteController < ApplicationController
    skip_before_action :verify_authenticity_token

    def create
        account = Account.find_by('email': session[:user_email])
        profile = Profile.find_by('email': session[:user_email])

        if (account.nil? && profile.nil?)
            render json: { :success => false, :message => "You are not logged in." }
            return
        end

        account.destroy
        profile.destroy

        render json: { :success => true, :message => "Deleted account & profile successfully." }
    end
end