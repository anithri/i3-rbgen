# Update this Gemfile with any additional dependencies and run
# 'bundle install' to get them all installed. Daemon-kit's capistrano
# deployment will ensure that the bundle required by your daemon is properly
# installed.
#
# For more information on bundler, please visit http://gembundler.com

source 'https://rubygems.org'

gem 'daemon-kit', :github => 'kennethkalmer/daemon-kit'

#
# safely (http://github.com/kennethkalmer/safely)
#

gem 'safely' # Optional, but recommended.

# gem 'toadhopper' # For reporting exceptions to hoptoad
# gem 'mail' # For reporting exceptions via mail


gem 'rufus-scheduler', '~> 2.0'
group :development, :test do
  gem 'rake'
  gem 'rspec' 
end