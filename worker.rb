require 'sidekiq'

# If your client is single-threaded, we just need a single connection in our Redis connection pool
Sidekiq.configure_client do |config|
  config.redis = { :size => 1, :url => 'redis://localhost:6379/0' }
end

# Start up sidekiq via
# sidekiq -r worker.rb
# and then you can open up an IRB session like so:
# irb -r worker.rb
# create jobs
# 100.times { HardWorker.perform_async "lulz" }
#

class HardWorker
  include Sidekiq::Worker

  def perform(name)
    puts 'Doing hard work'
    sleep(5)
    puts 'done'
  end
end