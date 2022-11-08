class DashBoardController < ApplicationController
  @@user_id = 2
  def index
    @user = User.find(@@user_id)
    @profile = @user.profile
    # @profile.image.attach(io: File.open("/home/ansh/Downloads/ansh.png"), filename: "profile_pic#{@@user_id}")
  end

  def uploadPicture
    @user = User.find(@@user_id)
    @profile = @user.profile
    if @profile.image.attached?
      removeProfilePic()
      puts "Image already uploaded"
      @profile.image.attach(params["@profile"]["image"])
      puts "Image changed successfully"
    else
      @profile.image.attach(params["@profile"]["image"])
      puts "Image uploaded successfully"
    end
    redirect_to "/dash_board"
  end

  private
    def removeProfilePic
      @user = User.find(@@user_id)
      @profile = @user.profile
      @profile.image.purge
      puts "Image Purged successfully"
    end
end
