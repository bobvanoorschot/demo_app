# frozen_string_literal: true

namespace :blog do
  desc 'Updating comments from blog posts'
  task update_comments_show: :environment do
    Blog.all.each do |blog|
      CommentService.new(blog).update_comments_show
    end
  end
end
