class ApplicationController < ActionController::Base
    def landing
        render html: "Hello!"
    end
end
