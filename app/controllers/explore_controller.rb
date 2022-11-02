class ExploreController < ApplicationController
    # get this user_id of the user who logins
    @@current_user = 1
    def index
        @posts = []
        posts = Post.all
        @notifications = []
        posts.map do |post|
            post_ob = Hash.new
            post_ob[:isLiked] = get_is_liked(post)
            post_ob[:post] = post
            post_ob[:isapplied] = get_is_applied(post)
            post_ob[:poster_user] = get_job_poster_details(post)
            post_ob[:applicants] = get_applicants(post)
            post_ob[:poster_profile] = post_ob[:poster_user].profile
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

    def get_is_applied(post)
        isapplied = Application.where(post_id: post.id, applicant_id: @@current_user).count > 0 ? true : false
        if(isapplied)
            true
        else
            false
        end
    end

    def get_applicants(post)
        isapplied = Application.where(post_id: post.id)
        if(isapplied.count > 0)
            isapplied.count
        else
            0
        end
    end
end
