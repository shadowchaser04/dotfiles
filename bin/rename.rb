#!/usr/bin/env ruby
require 'pry'
require 'json'

# Creates and array of absolute filepaths.
def sub_dir(directory_location)
  raise ArgumentError, "Argument must be a String" unless directory_location.class == String
  Dir.glob(directory_location + "/**/*").select{ |f| File.file? f }
end

home = ENV['HOME']
downloads = File.join(home, 'Downloads/Clean')
clean_directory = File.join(home, 'Downloads/Clean')

down = sub_dir(downloads).each { |file|

  # strip the base directory of the path
  name = File.basename(file).split(/\./)[0]
  name.downcase!
  name.gsub!(/[^(\w|\d|\.|\')]/, ' ')
  name.gsub!(/(_| ){1,4}/, " ")
  type = File.extname(file).split(/\./)[1]

  # concat name and its file type
  filename = name + '.' + type

  # final string
  file_renamed = clean_directory + "/" + filename

  # make sure there are no partial files being downloaded
  unless File.extname(file).split(/\./)[1] =~ /part/

    # rename the file
    FileUtils.mv(file, file_renamed)

  end

}

