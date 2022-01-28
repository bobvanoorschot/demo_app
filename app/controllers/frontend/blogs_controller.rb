# frozen_string_literal: true

module Frontend
  class BlogsController < ApplicationController
    before_action :set_blog, only: %i[show comment]

    # GET /blogs or /blogs.json
    def index
      @blogs = Blog.includes(:comments).published
      @blogs += @blogs.where(title: params['title']) if params['title']
    end

    # GET /blogs/1 or /blogs/1.json
    def show
      @comments = @blog.comments.visible.desc

      @comment = Comment.new

      respond_to do |format|
        format.html
        format.pdf do
          render pdf: @blog.title
        end
      end
    end

    def comment
      @comment = @blog.comments.new(comment_params)

      respond_to do |format|
        if @comment.save

          CommentMailer.new_comment(@comment, @blog.user).deliver_now unless @blog.user.nil?

          format.html { redirect_to frontend_blog_url(@blog), notice: 'Comment was successfully created.' }
        else
          format.html { render :show, status: :unprocessable_entity }
        end
      end
    end

    private

    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:name, :body)
    end
  end
end
