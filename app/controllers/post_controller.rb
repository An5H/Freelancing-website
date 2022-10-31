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
        @isLiked = (@post.likes.find_by liker_id: @@user_id).nil? ? false : true

        # complete this feature
        @isApplied = false
    end
end
