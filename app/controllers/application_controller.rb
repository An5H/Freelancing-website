class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

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

    protected
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up, keys: [:f_name, :l_name, :username])
    end

end