# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

every :day, at: '10:00am' do
  rake 'send_daily_letters'
end

# To run this comman localy:
# $ rake send_daily_letters
