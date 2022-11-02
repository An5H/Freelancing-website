class ApplicationController < ActionController::Base
    @@user_id = 1
    def index
        @applications = Application.where(applicant_id: @@user_id)
    end
end
