class ProfileController < ApplicationController
    def show
        username = params[:username]
        @user = User.find_by(username: username)
        @profile = @user.profile
    end
end
