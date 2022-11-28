module PostHelper
    def check_avatar(profile)
        @avatar = profile.image
        if @avatar.nil? or !@avatar.attached?
            "no_profile_pic.jpg"
        elsif @avatar.attached?
            @avatar
        end
   end

   def get_poster_pic(post)
    user_id = post.user_id
    @user = User.where(id: user_id).first
    return check_avatar(@user.profile)
   end
end
