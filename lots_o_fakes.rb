require File.join(File.dirname(__FILE__), 'hard_worker')
require 'awesome_print'

jobs = 100

jobs.times do |i|
  HardWorker.perform_async('lulz')
end

puts "created #{jobs} jobs".yellow