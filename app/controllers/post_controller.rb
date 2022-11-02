class PostController < ApplicationController
    @@user_id = 1
    def like
        @post = Post.all.find(params[:id])
        @like = @post.likes.create(liker_id: @@user_id, post_id: @post.id)
        redirect_to post_path(@post)
    end

    def unlike
        @post = Post.all.find(params[:id])
        Like.where(post_id: @post.id, liker_id: @@user_id).destroy_all
        redirect_to post_path(@post)
    end

    def show
        @post = Post.all.find(params[:id])
        @user = @post.user
        @isLiked = get_is_liked(@post)
        # complete this feature
        @isApplied = get_is_applied(@post)
        @applicants = get_applicants(@post)
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
            redirect_to post_path(@post)
        else
            puts "Application already applied"
            redirect_to post_path(@post)
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

    def get_applicants(post)
        isapplied = Application.where(post_id: post.id)
        if(isapplied.count > 0)
            isapplied.count
        else
            0
        end
    end
end
