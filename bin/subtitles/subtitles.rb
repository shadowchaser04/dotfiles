#!/usr/bin/env ruby

require 'pry'
require 'json'

#------------------------------------------------------------------------------
# download subtitles
#------------------------------------------------------------------------------

# download subtitles
def download_subtitles(address)
  'youtube-dl --write-auto-sub --sub-format best --sub-lang en --skip-download /Users/shadowchaser/.dotfiles/bin/subtitles/Youtube_Subtitles/Subs/%(title)s.%(ext)s' "#{address}"
end


# loop the user request
while true

  # message for the user
  puts "please enter url:>"

  # take user reply
  url = gets.chomp

  # validation
  if url =~ /[h][t][t][p][s]\:\/\/[w][w][w]\.[y][o][u][t][u][b][e]\.[c][o][m]/
    # download the subtitles
    download_subtitles(url)

    # break the loop
    break
  end

end
binding.pry

#------------------------------------------------------------------------------
#
#------------------------------------------------------------------------------

#
# clean subtitles
#

#------------------------------------------------------------------------------
# build data
#------------------------------------------------------------------------------

# build datasets
def find_files(path)
  Dir.glob("#{path}" + "/**/*").select{ |f| File.file? f }
end

# subtitles main directory
subtitles_directory = "/Users/shadowchaser/.dotfiles/bin/subtitles/Youtube_Subtitles"

# data directories
data = File.join(subtitles_directory, "Data")
subtitles = File.join(subtitles_directory, "Subtitles")

# used for datafiles
data_d = find_files(data)

# used for getting the subtitles
sub_d = find_files(subtitles)

#------------------------------------------------------------------------------
# take user input
#------------------------------------------------------------------------------
#
# take user input
#
user_input = gets.chomp

# array of words passed in by user
user = user_input.split

# run subtitles throught the datasets
#
# run user input throught the subtitles
#
#

