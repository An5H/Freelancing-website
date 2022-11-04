module ExploreHelper
    def get_created_at(created_at)
        current_time = Time.now
        time_diff = current_time.day - created_at.day
        if(time_diff == 0)
            time = "Today " + created_at.localtime.strftime("%H:%M %p").to_s

        elsif(time_diff > 0 && time_diff < 2)
            time = "Yesterday " + created_at.localtime.strftime("%H:%M %p").to_s

        else
            time = created_at.localtime.strftime("%H:%M %p").to_s
        end
    end

    def get_likes(likes_count)
        begin
            likes = ""
            if(likes_count > 1)
                likes = likes_count.to_s + " likes"
            elsif (likes_count == 1)
                likes = likes_count.to_s + " like"
            else
                likes = "0 likes"
            end
        rescue
            likes = "0 likes"
        end
    end
    
end