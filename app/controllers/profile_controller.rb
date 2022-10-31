class ProfileController < ApplicationController
    @@user_id = 1
    def create
        @profile = Profile.find(@@user_id)
        if @profile.update(profile_params)
            redirect_to @profile
          else
            render :show, status: :unprocessable_entity
        end
    end

    def save
        if @profile.save
            redirect_to @profile
        else
            render :new, status: :unprocessable_entity
        end
    end
end
