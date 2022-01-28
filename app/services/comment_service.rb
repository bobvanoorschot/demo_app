# frozen_string_literal: true

class CommentService
  def initialize(blog)
    @blog = blog
  end

  def update_comments_show
    @blog.comments.each do |comment|
      if @blog.draft?
        comment.hide!
      elsif @blog.published?
        comment.visible!
      end
      comment.save
    end
  end
end
