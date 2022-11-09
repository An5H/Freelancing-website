class DashBoardController < ApplicationController
  def index
    @user = User.find(current_user.id)
    check_user_profile_exists()
    @profile = @user.profile
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])

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

    def check_user_profile_exists()
      if user_signed_in?
          isProfilePresent = Profile.where(user_id: current_user.id)
          if(isProfilePresent.nil? or isProfilePresent.empty?)
              Profile.create(user_id: current_user.id, profession: "None", rating: 0.0, open_to_work: true, open_to_hire: false, experience: 0, contact_number: "None", state: "None", country: "None")
          end
      end
  end
end
