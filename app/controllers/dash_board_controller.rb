class DashBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    @profile = @user.profile
  end

  def edit
    if user_signed_in?
      @profile = current_user.profile
    end
  end

  def update
    @profile = Profile.find(current_user.profile.id)

    if @profile.update(profile_params)
        redirect_to "/dash_board"
    else
        render :edit, status: :unprocessable_entity
    end
  end

  def create
    @user = User.find(current_user.id)
    @profile = @user.profile
    if @profile.image.attached?
      removeProfilePic()
      @profile.image.attach(params["@profile"]["image"])
    else
      @profile.image.attach(params["@profile"]["image"])
    end
    redirect_to "/dash_board"
  end

  private
    def profile_params
      params.require(:profile).permit(:profession, :contact_number, :state, :country)
    end

    def removeProfilePic
      @user = User.find(current_user.id)
      @profile = @user.profile
      @profile.image.purge
      puts "Image Purged successfully"
    end
end
