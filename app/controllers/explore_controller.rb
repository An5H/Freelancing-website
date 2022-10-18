class ExploreController < ApplicationController
    def index
        @posts = []

        addinfo = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Eveniet eaque est
        facilis iusto reiciendis, deleniti consequuntur sunt, nisi, aut"

        description = "Lorem ipsum dolor sit amet consectetur adipisicing elit. Minus, repellat.
        Omnis iure adipisci odit eos ipsum illum illo, qui, iste quis architecto hic
        magni necessitatibus, magnam rerum dicta dolores quas?"

        @posts << Post.new("Job-Heading-1", "Job-Type-1", description, addinfo)
        @posts << Post.new("Job-Heading-2", "Job-Type-2", description, addinfo)
        @posts << Post.new("Job-Heading-3", "Job-Type-3", description, addinfo)
    end

    def show
        @data = Hash.new("Job-Heading-1")
        respond_to do |format|
            format.js {render layout: false}
            format.html { render 'index'}
          end
    end

    def destroy
        
    end

end

class Post
    def initialize(heading, type, description, addinfo)
       @post_heading = heading
       @post_type = type
       @post_job_description = description
       @post_job_addinfo = addinfo
    end

    def get_post_heading
        @post_heading
    end

    def get_post_Type
        @post_type
    end

    def get_post_AdditionalInfo
        @post_job_addinfo
    end

    def get_post_Description
        @post_job_description
    end
 end