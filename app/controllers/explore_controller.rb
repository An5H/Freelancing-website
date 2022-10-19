class ExploreController < ApplicationController
    # get this user_id of the user who logins
    @@user_id = 1
    def index
        @user = User.find(@@user_id)
        @posts = []
        posts = Post.all
        posts.map do |post|
            post_ob = Hash.new
            post_ob[:isLiked] = get_is_liked(post)
            post_ob[:post] = post
            post_ob[:applied] = true
            post_ob[:likes] = get_likes(post)
            post_ob[:created_at] = get_created_at(post)
            @posts << post_ob
        end

    end

    private
    def get_is_liked(post)
        isLiked = Like.where(post_id: post.id, liker_id: @@user_id).count
        if(isLiked > 0)
            true
        else
            false
        end
    end

    def get_likes(post)
        begin
            likes = ""
            likes_count = Like.where(post_id: post.id).count
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

    def get_created_at(post)
        current_time = Time.now
        created_at = post.created_at
        time_diff = current_time.day - created_at.day
        if(time_diff == 0)
            time = "Today " + created_at.localtime.strftime("%H:%M %p")

        elsif(time_diff > 0 && time_diff < 2)
            time = "Yesterday " + created_at.localtime.strftime("%H:%M %p")

        else
            time = created_at.localtime.strftime("%H:%M %p")
        end
    end
end
