#!/usr/bin/env ruby
require 'pry'
require 'json'
require 'logger'

# read in a file.
file = "serial-killers.json"
data_hash = JSON.parse(File.read(file))


