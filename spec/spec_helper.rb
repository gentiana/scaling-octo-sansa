require 'rubygems'
require 'spork'
require 'rspec/its'

#uncomment the following line to use spork with the debugger
#require 'spork/ext/ruby-debug'

Spork.prefork do
  RSpec.configure do |config|
  end
end

Spork.each_run do
end
