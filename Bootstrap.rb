#!/usr/bin/env ruby

require "FileUtils"
require "logger"
require "pry"

#{{{1 color methods
# output
def red(mytext)
    "\e[31m#{mytext}\e[0m"
end

def blue(mytext)
    "\e[34m#{mytext}\e[0m"
end

def green(mytext)
    "\e[32m#{mytext}\e[0m"
end
#}}}
#{{{1 class
class Dotfiles
  attr_accessor :data

  def initialize
    @home = ENV['HOME']
    @dotfiles_temp = File.join(@home, "dotfiles-temp")
    @dot_path = File.join(@home, ".dotfiles")

    # array used by most methods
    @dotfiles = Array.new

    # hash with nested hash
    @data_hash = Hash.new {|h, k| h[k] = [] }

    # check this it may need to an instance.
    self.make_temp_dir(@dotfiles_temp)
    self.directory_files
    self.directorys
  end

  # mv files in home dir to the dotfiles_temp directory.
  def mv_file_and_dir(item)
    begin
      if File.file?(item)
        FileUtils.cp(item, @dotfiles_temp)
      elsif Dir.exist?(item)
        FileUtils.cp_r(item, @dotfiles_temp)
      end
    rescue
      puts "Error: unable to copy #{item}"
    end
  end

  # Tests whether the file or directory exists.
  def sym_link(item)
    if File.file?(item) || Dir.exist?(item)
      striped_name = item.split("/")[-1]
      FileUtils.symlink(item, @home + "/" + "." + striped_name)
    end
  end

  # Creates and array of absolute filepaths.
  def directory_files
    Dir.glob(@home + '/.dotfiles/*').each { |f| if File.file?(f) then (@data_hash['files']||=[]) << f end}
    @data_hash['files'].map! {|f| unless File.extname(name(f)) =~ /^\./ then f end }
  end

  # Creates and array of directories.
  def directorys
    Dir.glob(@dot_path + "/*").each {|d| if File.directory?(d) then (@data_hash['dirs']||=[]) << d end}
  end

  # make temp directory or exit.
  def make_temp_dir(name)
      if Dir.exist?(name)
          puts red("Before continuing please remove temp dir " + name)
          exit
      else
          Dir.mkdir(name)
          puts green("Successfully created temp dir: " +  name)
      end
  end

  # Returns the last component of the filename given in file_name (after first
  # stripping trailing separators)
  def name(base)
    File.basename(base)
  end

  def home_dotfile(file_name, base)
    File.expand_path(file_name, base)
  end

  # hash
  def data
    @data_hash
  end

end

#}}}

#
# TODO: add logger for the methods and output.
# TODO: ignore directories specified.
#

#------------------------------------------------------------------------------
# Logger
#------------------------------------------------------------------------------
# Create an instance of logger and set the time date format.
$LOG = Logger.new STDOUT

# program name
$LOG.progname = "[dotfiles]"

$LOG.formatter = lambda do |severity, datetime, progname, msg|
  date_format = datetime.strftime("%Y-%m-%d %H:%M:%S")
  "#{progname} [#{date_format} ##{Process.pid}]: #{severity} -- : #{msg}\n"
end

$LOG.info blue("subtitles started")

#------------------------------------------------------------------------------
# Dotfiles
#------------------------------------------------------------------------------
# starting dotfiles.
$LOG.info blue("Starting dotfiles...")

# Create an instance of the class Dotfiles.
dot = Dotfiles.new

# Clone the data hash. As the files full path is used.
data_hash = dot.data.clone

# Each value of the hash is an Array. On each array the compact method is used
# to remove nil. The array is then mapped. Each element of the mapping is split
# creating a array of file path elements. Lastly the negative index is used to
# count backwards from the end of the array retrieving the last part of the
# file path.
# TODO: add logger
(dot.data['names']||=[]) << data_hash.values[0].compact.map {|name| name.split("/")[-1] }
(dot.data['names']||=[]) << data_hash.values[1].compact.map {|name| name.split("/")[-1] }

# home env
home = ENV['HOME']

dot.data['names'].flatten.each {|name|

  # join home dir to the filename
  file_and_dir = home + "/" + "." + name

  # mv files to temp directory
  dot.mv_file_and_dir(file_and_dir)

}

# create symbolic links from source to target directory.
dot.data['files'].each {|name| dot.sym_link(name) }
