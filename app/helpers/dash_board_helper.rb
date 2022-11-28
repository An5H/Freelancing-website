module DashBoardHelper
    def get_notification_data()
        @notifications = []
        Post.all.map do |post|
            notification_data = Hash.new
            notification = get_notification(post)
            if !notification.nil? && notification.count != 0 && notification != []
                notification_data[:notification] = notification.first
                notification_data[:post] = post
                @notifications << notification_data
            end
        end
        if(@notifications.empty?) 
            []
        else 
            @notifications
        end
    end

    private
    def get_notification(post)
        nfs = []
        if user_signed_in?
            nfs = Notification.where(post_id: post.id, user_id: current_user.id)
        else
            nfs
        end
    end
end
