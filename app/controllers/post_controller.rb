class PostController < ApplicationController
    @@user_id = 1
    def like
        @post = Post.all.find(params[:id])
        @like = @post.likes.create(liker_id: @@user_id, post_id: @post.id)
        redirect_to "/explore"
    end

    def unlike
        post_id = params[:id]
        Like.where(post_id: post_id, liker_id: @@user_id).destroy_all
        redirect_to "/explore"
    end
end