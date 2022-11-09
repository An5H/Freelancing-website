module PostHelper
    def check_avatar(profile)
        @avatar = profile.image
        if @avatar.nil? or !@avatar.attached?
            "no_profile_pic.jpg"
        elsif @avatar.attached?
            @avatar
        end
   end
end
