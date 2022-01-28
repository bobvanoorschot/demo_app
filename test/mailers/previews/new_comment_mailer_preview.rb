# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class NewCommentMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/test_mailer/send
  def new_comment
    blog = Blog.create(title: 'My Blog')
    comment = Comment.create(name: 'My Name', blog: blog)
    user = User.find_or_create_by(email: 'preview@mailer.com')

    CommentMailer.new_comment(comment, user)
  end
end
