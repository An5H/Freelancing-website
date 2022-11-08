class ApplicationController < ActionController::Base
    # before_action :authorized
    # helper_method :current_user
    # helper_method :logged_in?

    # def current_user        
    #     User.find_by(id: session[:user_id])  
    # end

    # def logged_in?   
    #     !current_user.nil?  
    # end

    # def authorized   
    #     redirect_to '/explore' unless logged_in?
    # end

    def index
        @applications = Application.where(applicant_id: @@user_id)
    end

    def accept
        @post = Post.find(params[:post_id])
        application = Application.where(applicant_id: params[:user_id], post_id: params[:post_id])
        application.update(status: 'Accepted')

        #generate a notification for the application to the user
        @notification = Notification.create(user_id: params[:user_id], post_id: params[:post_id], message: "Congratulations you are selected for this job application.", status: "unread")
        redirect_to post_path(@post)
    end

    def reject
        @post = Post.find(params[:post_id])
        application = Application.where(applicant_id: params[:user_id], post_id: params[:post_id])
        application.update(status: 'Rejected')

        #generate a notification for the application to the user
        @notification = Notification.create(user_id: params[:user_id], post_id: params[:post_id], message: "Thankyou for applying to this position, but we are sorry to inform you that, we don't find your skills to be right fit for the job", status: "unread")
        redirect_to post_path(@post)
    end
end
