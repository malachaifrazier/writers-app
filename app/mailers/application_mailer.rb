class ApplicationMailer < ActionMailer::Base
  default from: Figaro.env.super_email
  layout 'mailer'
end
