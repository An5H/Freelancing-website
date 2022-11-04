class PostController < ApplicationController
    @@user_id = 1
    def like
        @post = Post.all.find(params[:id])
        #check if already liked
        isLiked = Like.where(liker_id: @@user_id, post_id: @post.id).count > 0 ? true : false
        if(isLiked) 
            puts "Already liked"
            redirect_to "/explore"
        else
            @like = @post.likes.create(liker_id: @@user_id, post_id: @post.id)
            redirect_to post_path(@post)
        end
    end

    def unlike
        @post = Post.all.find(params[:id])
        isLiked = Like.where(liker_id: @@user_id, post_id: @post.id).count > 0 ? true : false
        if(isLiked)
            Like.where(post_id: @post.id, liker_id: @@user_id).destroy_all
            redirect_to post_path(@post)
        else
            puts "Could not unlike, if not liked already"
            redirect_to "/explore"
        end
    end

    def show
        @post = Post.all.find(params[:id])
        @user = @post.user
        @isLiked = get_is_liked(@post)
        @isApplied = get_is_applied(@post)
        @applicants_data = get_applicant_users(@post)
        @applicants = @applicants_data.size
        @isPostOwner = get_is_post_owner(@post)
    end

    def new
        @post = Post.new
    end

    def create
        # @post = Post.new(post_params)
        @post = Post.new(user_id: @@user_id, job_heading: params[:job_heading], job_type: params[:job_type], job_description: params[:job_description], additional_info: params[:additional_info])
        if @post.save
            redirect_to @post
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])

        if @post.update(post_params)
            redirect_to @post
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to root_path, status: :see_other
    end

    def apply
        @post = Post.find(params[:id]) 
        # check if already applied
        isalreadyApplied = Application.where(post_id: @post.id, applicant_id: @@user_id).count > 0 ? true : false

        if(!isalreadyApplied)
            @applied = Application.create(post_id: @post.id, applicant_id: @@user_id, status: "In Progress")
            redirect_to "/explore"
        else
            puts "Application already applied"
            redirect_to "/explore"
        end
    end

    private
    def post_params
        params.require(:post).permit(:job_heading, :job_description, :job_type, :additional_info)
    end

    def get_is_liked(post)
        isLiked = Like.where(post_id: post.id, liker_id: @@user_id).count
        if(isLiked > 0)
            true
        else
            false
        end
    end

    def get_is_applied(post)
        isapplied = Application.where(post_id: post.id, applicant_id: @@user_id).count > 0 ? true : false
        if(isapplied)
            true
        else
            false
        end
    end

    def get_applicant_users(post)
        job_post = Application.where(post_id: post.id)
        app_data = []
        job_post.each do |user|
            user_data = Hash.new
            cur_user = User.where(id: user.applicant_id)
            user_data[:user] = cur_user.first
            user_data[:status] = get_application_status(user.applicant_id, post.id)
            user_data[:applied_at] = get_applied_at(user.applicant_id, post.id)
            app_data << user_data
        end

        if(app_data.empty?)
            []
        else
            app_data
        end
    end

    def get_application_status(userId, postId)
        application = Application.where(applicant_id: userId, post_id: postId)
        if(!application.nil? && application.count > 0)
            status = application.first.status
        else
            status = "Job Post Unavailable"
        end
    end

    def get_applied_at(userId, postId)
        application = Application.where(applicant_id: userId, post_id: postId)
        if(!application.nil? && application.count > 0)
            applied_at = application.first.created_at
        else
            applied_at = "Data unavailable"
        end
    end

    def get_is_post_owner(post)
        if(post.user_id == @@user_id)
            true
        else
            false
        end
    end
end
