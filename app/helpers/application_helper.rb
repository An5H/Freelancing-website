module ApplicationHelper
    def get_post(post_id)
        begin
            @post = Post.find(post_id)
            if(@post.nil?)
                nil
            else 
                @post
            end
        rescue
            nil
        end
    end
end
