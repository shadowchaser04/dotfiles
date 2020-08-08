#!/usr/bin/env ruby
require 'pry'
require 'json'
require 'logger'

# make a hash of killers from a file
# have attr k -> name, then have sub hashes
#


# create a hash of hashes
serial_killers = Hash.new { |h,k| h[k] = Hash.new }

# read in a file.
file = "serial-killers.json"
data_hash = JSON.parse(File.read(file))
binding.pry
puts "fuck off"


