class ExploreController < ApplicationController
    # get this user_id of the user who logins
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
            if !notification.nil? && notification.count != 0 && notification != []
                notification_data[:notification] = notification.first
                notification_data[:post] = post
                @notifications << notification_data
            end
        end
        check_user_profile_exists()
    end

    private
    def get_is_liked(post)
        isLiked = 0
        if user_signed_in?
            isLiked = Like.where(post_id: post.id, liker_id: current_user.id).count
        end
        if(isLiked > 0)
            true
        else
            false
        end
    end

    def get_notification(post)
        nfs = []
        if user_signed_in?
            nfs = Notification.where(post_id: post.id, user_id: current_user.id)
        else
            nfs
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
        is_applied = false
        if user_signed_in?
            isapplied = Application.where(post_id: post.id, applicant_id: current_user.id).count > 0 ? true : false
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

    def check_user_profile_exists()
        if user_signed_in?
            isProfilePresent = Profile.where(user_id: current_user.id)
            if(isProfilePresent.nil? or isProfilePresent.empty?)
                Profile.create(user_id: current_user.id, profession: "None", rating: 0.0, open_to_work: true, open_to_hire: false, experience: 0, contact_number: "None", state: "None", country: "None")
            end
        end
    end
end
