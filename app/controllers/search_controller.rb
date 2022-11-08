class SearchController < ApplicationController
    def search
        query = params[:query]
        field = params[:field]
        if(query.nil? or query.empty? or field.nil? or field.empty?)
            redirect_to root_path and return
        else
            if(field == "job")
                @results = Post.all.where("lower(job_heading) LIKE ? OR lower(job_type) LIKE ? OR lower(job_description) LIKE ? OR lower(additional_info) LIKE ?", "%#{query}%", "%#{query}%", "%#{query}%", "%#{query}%")
            elsif(field == "candidate")
                @results = User.all.where("lower(f_name) LIKE ? OR lower(l_name) LIKE ? OR lower(username) LIKE ?", "%#{query}%", "%#{query}%","%#{query}%")
            end
        end
    end
end
