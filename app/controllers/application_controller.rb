class ApplicationController < ActionController::Base
    @@user_id = 1
    def index
        @applications = Application.where(applicant_id: @@user_id)
    end

    def accept
        @post = Post.find(params[:post_id])
        application = Application.where(applicant_id: params[:user_id], post_id: params[:post_id])
        application.update(status: 'Accepted')

        #generate a notification for the application to the user
        redirect_to post_path(@post)
    end

    def reject
        @post = Post.find(params[:post_id])
        application = Application.where(applicant_id: params[:user_id], post_id: params[:post_id])
        application.update(status: 'Rejected')
        redirect_to post_path(@post)
    end
end
