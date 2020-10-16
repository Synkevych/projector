# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'support@projector.com'
  layout 'mailer'
end
