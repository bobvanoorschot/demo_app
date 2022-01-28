# frozen_string_literal: true

class TestMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.test_mailer.send.subject
  #
  def send_mail(greeting)
    @greeting = greeting

    mail to: 'to@example.org'
  end
end
