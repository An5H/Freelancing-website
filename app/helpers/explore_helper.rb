module ExploreHelper
    def get_created_at(post)
        current_time = Time.now
        created_at = post.created_at
        time_diff = current_time.day - created_at.day
        if(time_diff == 0)
            time = "Today " + created_at.localtime.strftime("%H:%M %p").to_s

        elsif(time_diff > 0 && time_diff < 2)
            time = "Yesterday " + created_at.localtime.strftime("%H:%M %p").to_s

        else
            time = created_at.localtime.strftime("%H:%M %p")
        end
    end
end
