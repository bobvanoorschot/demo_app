# frozen_string_literal: true

class CommentMailer < ApplicationMailer
  def new_comment(comment, user)
    @comment = comment
    @blog = comment.blog

    pdf = WickedPdf.new.pdf_from_string(render_to_string(
                                          'frontend/blogs/show_blog', locals: { blog: @blog }
                                        ))

    attachments['file.pdf'] = pdf

    mail to: user.email, subject: 'New comment on blog'
  end
end
