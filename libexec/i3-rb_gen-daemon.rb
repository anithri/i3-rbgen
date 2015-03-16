# Generated cron daemon

# Do your post daemonization configuration here
# At minimum you need just the first line (without the block), or a lot
# of strange things might start happening...
DaemonKit::Application.running! do |config|
  # Trap signals with blocks or procs
  # config.trap( 'INT' ) do
  #   # do something clever
  # end
  # config.trap( 'TERM', Proc.new { puts 'Going down' } )
end

# Configuration documentation available at http://rufus.rubyforge.org/rufus-scheduler/
# An instance of the scheduler is available through
# DaemonKit::Cron.scheduler

# To make use of the EventMachine-powered scheduler, uncomment the
# line below *before* adding any schedules.
# DaemonKit::EM.run

# Some samples to get you going:

# Will call #regenerate_monthly_report in 3 days from starting up
#DaemonKit::Cron.scheduler.in("3d") do
#  regenerate_monthly_report()
#end
#


clock = I3::Blocks::Clock.new(I3::Bar::SEND_WITH.get_config('clock'))
clock.tick.send
#DaemonKit::Cron.scheduler.every "5s" do
DaemonKit::Cron.scheduler.cron "* * * * *" do
  clock.tick.send
end

load_avg = I3::Blocks::Load.new(name: 'load')
load_avg.tick.send
mem_info = I3::Blocks::Mem.new(name: 'mem')
mem_info.tick.send
DaemonKit::Cron.scheduler.every('5s') do
  load_avg.tick.send
  mem_info.tick.send
end

# check weather every 15 minuts
weather = I3::Blocks::Weather.new(name: 'weather', units: 'f')
weather.tick.send
DaemonKit::Cron.scheduler.cron "0,15,30,45 * * * *" do
  weather.tick.send
end
#
# Example error handling (NOTE: all exceptions in scheduled tasks are logged)
#DaemonKit::Cron.handle_exception do |job, exception|
#  DaemonKit.logger.error "Caught exception in job #{job.job_id}: '#{exception}'"
#end

DaemonKit::Cron.scheduler.every("1m") do
  DaemonKit.logger.debug "Scheduled task completed at #{Time.now}"
end

# Run our 'cron' dameon, suspending the current thread
DaemonKit::Cron.run
