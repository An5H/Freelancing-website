class ProfileController < ApplicationController
    def user
        @user = User.find_by(username: params[:username])
        @profile = @user.profile
    end
end
