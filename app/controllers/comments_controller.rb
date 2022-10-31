class CommentsController < ApplicationController
    @@user_id = 1
    def create
        @post = Post.find(params[:post_id])
        @comment = params[:comment]
        @comment = @post.comments.create(commenter_id: @@user_id, comment: @comment["comment"])
        redirect_to post_path(@post)
    end

    def show
        @post = Post.find(params[:post_id])
        comment = @post.comments.find(params[:id]).destroy
        redirect_to post_path(@post)
    end

    private
        def comment_params
            params.require(:comment).permit(:comment)
        end
end
