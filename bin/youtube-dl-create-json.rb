#!/usr/bin/env ruby
require 'pry'
require 'json'


class YoutubeDl
  attr_accessor :filepaths

  def initialize
    @root = "/Users/shadowchaser/Downloads/MovieDownloads"
    @filepaths = Hash.new { |h,k| h[k] = Hash.new { |h,k| h[k] = [] } }
  end

  def youtube_subtitles(address)
      system("youtube-dl --write-info-json --skip-download  \'#{address}\'")
  end

  # Creates and array of absolute filepaths.
  def sub_dir(directory_location)
    raise ArgumentError, "Argument must be a String" unless directory_location.class == String
    Dir.glob(directory_location + "/**/*").select{ |f| File.file? f }
  end

  def clean_attribute(attr)
    attr.downcase!
    # add things we want to keep
    attr.gsub!(/[^(\w|\d|\.|\'|\’|\,|\n)]/, ' ')
    attr.gsub!(/(_| ){1,4}/, " ")
    attr.strip
  end
  # Create a filepath array saving the returned value of the sub_dir method
  # invocation in a variable called subtitle_path which is an Array. We then
  # loop over the Array creating the String variable `name' which is the
  # basename and the String variable `type' which is the extension type. (json,
  # vtt). A hash is lastly created using the `name' variable to create a key
  # and the `type' variable to create two nested keys, the values of which are
  # the `file' block variable which is the absolute file path.

  # pass in the root_dir
  def create_filepaths
    subtitle_path = sub_dir(@root)
      subtitle_path.each do |file|
        begin
          name = File.basename(file).split(/\./)[0]
          type = File.extname(file).split(/\./)[1]
          @filepaths[name][type] = file
        rescue Exception => e
          puts "#{__FILE__}:#{__LINE__}:in #{__method__}: #{e}"
        end
      end
      @filepaths.reject! { |k,v| v.count != 2 }
      fp = @filepaths
      return fp
  end

end

# create a hash of hashes
result = Hash.new { |h,k| h[k] = Hash.new }

# create an instance of the class YoutubeDl
youtube = YoutubeDl.new

# create a hash of the filepaths
youtube.create_filepaths

# loop over the filepaths
youtube.filepaths.each do |k,file|

  # read the youtube-dl json file
  data_hash = JSON.parse(File.read(file['json']))

  # formatt the title
  result[k]['title'] = data_hash['title']
  title = youtube.clean_attribute(result[k]['title'])

  # video id this is the id attached to https://youtube.com/watch?v="id"
  result[k]['id'] = data_hash['id']

  # google url
  result[k]['url'] = data_hash['url']

  # int - duration
  result[k]['duration'] = data_hash['duration']

  # channel uplaoser
  result[k]['uploader'] = data_hash['uploader']

  # channel id
  result[k]['channel_id'] = data_hash['channel_id']

  # page of the youtube url of the uploader
  result[k]['webpage_url'] = data_hash['webpage_url']

  # video description
  result[k]['description'] = data_hash['description']
  description = youtube.clean_attribute(result[k]['description'])

  # json
  result[k]['json'] = file['json']

  # mp4
  result[k]['mp4'] = file['mp4']

end

binding.pry
f = "/Users/shadowchaser/Downloads/Playlist/playlist.json"

File.open(f,"w") do |f|
  f.write(result.to_json)
end


