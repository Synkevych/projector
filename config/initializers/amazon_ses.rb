# frozen_string_literal: true

ActionMailer::Base.add_delivery_method :ses, AWS::SES::Base,
                                       :access_key_id => Rails.application.credentials.aws[:access_key_id],
                                       :secret_access_key => Rails.application.credentials.aws[:secret_access_key],
                                       :server => 'email.us-west-2.amazonaws.com',
                                       :message_id_domain => 'us-west-2.amazonaws.com'
