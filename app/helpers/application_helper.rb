module ApplicationHelper
    def get_post(post_id)
        @post = Post.find(post_id)
        if(@post.nil?)
            nil
        else 
            @post
        end
    end
end
