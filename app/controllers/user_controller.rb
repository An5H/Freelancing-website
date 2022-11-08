class UserController < ApplicationController
    def show
        @user = User.find(params[:id])
        @profile = @user.profile
    end

    def index
        @user = User.find(1)
    end
end
