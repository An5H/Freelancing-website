module CommentsHelper
    def get_comments_count(post)
        comments_count = post.comments.count
        begin
            comments = ""
            if(comments_count > 1)
                comments = comments_count.to_s + " comments"
            elsif (comments_count == 1)
                comments = comments_count.to_s + " comment"
            else
                comments = "0 comments"
            end
        rescue
            comments = "0 comments"
        end
    end
end
