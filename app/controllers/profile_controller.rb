class ProfileController < ApplicationController
    def user
        @user = params[:username]
        puts "Welcome #{@user}"
    end
end
