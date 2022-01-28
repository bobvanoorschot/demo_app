# frozen_string_literal: true

module Admin
  class BlogsController < CrudController
    before_action :set_blog, only: %i[toggle_status]
    before_action :authenticate_user!

    # GET /blogs or /blogs.json
    def index
      super
      @blogs = @blogs.includes(:comments)
    end

    # GET /blogs/1 or /blogs/1.json
    def show
      @comments = @blog.comments.visible.desc
    end

    def toggle_status
      if @blog.draft?
        @blog.published!
      elsif @blog.published?
        @blog.draft!
      end

      redirect_to admin_blogs_url
    end

    def model_name
      'blog'
    end

    def friendly
      true
    end

    def model_path
      'admin_blog'
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      resource
    end

    def default_params
      params.require(model_name).permit(:title, :body, :image)
    end
  end
end
