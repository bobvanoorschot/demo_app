# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/test_mailer
class TestMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/test_mailer/send
  def send_mail
    TestMailer.send_mail('Hello')
  end
end
