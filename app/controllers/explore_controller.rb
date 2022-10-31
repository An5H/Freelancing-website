class ExploreController < ApplicationController
    # get this user_id of the user who logins
    @@current_user = 1
    def index
        @user = User.find(@@current_user)
        @posts = []
        posts = Post.all
        @notifications = []
        @notification = Hash.new

        posts.map do |post|
            post_ob = Hash.new
            post_ob[:isLiked] = get_is_liked(post)
            post_ob[:post] = post
            post_ob[:applied] = true
            @posts << post_ob

            notification_data = Hash.new
            notification = get_notification(post)
            if notification.count != 0 and notification != []
                notification_data[:notification] = notification
            end
            notification_data[:post] = post
            notification_data[:job_poster_details] = get_job_poster_details(post)

            @notifications << notification_data
        end
    end

    private
    def get_is_liked(post)
        isLiked = Like.where(post_id: post.id, liker_id: @@current_user).count
        if(isLiked > 0)
            true
        else
            false
        end
    end

    def get_notification(post)
        nfs = Notification.where(post_id: post.id, user_id: @@current_user, status: "unread")
        if(nfs.count > 0)
            nfs
        else
            []
        end
    end

    def get_job_poster_details(post)
        user = User.find_by id: post.user_id
        if(user != nil)
            user
        else
            []
        end
    end
end
