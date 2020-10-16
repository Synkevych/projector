# frozen_string_literal: true

desc 'daily letters'
  task send_daily_letters: :environment do
    User.with_enabled_email_receiving.find_each do |user|
      Card.kept.for_today.where('user_id=? OR assignee_id=?', user.id, user.id).find_each do |card|
        CardMailer.with(user: user, card: card).start_date_notify.deliver_later
      end
    end
end
