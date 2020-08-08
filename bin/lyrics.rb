#!/usr/bin/env ruby

require 'pry'
require 'mechanize'

# color the text
def blue(term)
  "\e[34m #{term} \e[0m" 
end

# create a class album, with a attributes method.
class Album
  attr_reader :artist, :title, :album, :year, :lyrics

  def attributes(args={})
    @artist = args[:artist]
    @title = args[:title]
    @album = args[:album]
    @year = args[:year]
    @lyrics = args[:lyrics]
  end

end

running = true

# create an instance of mechanize, in this case agent.
# then use the get method to retrive the page. 
agent = Mechanize.new
page = agent.get('https://www.lyrics.com')

# find the specific form on the page used to submit my search request.
google_form = page.form_with(:method => 'GET')

while running == true

  puts "----------------------------------------------------------------------"
  puts "Enter the lyric\:\>"

  # take the user input
  user_input = gets.chomp

  # add the search term to the field in this case st is the name.
  google_form.st = user_input

  # submit the form
  page = agent.submit(google_form)

  if page.css('hgroup > h4').text =~ /We couldn't find any lyrics/
    puts "Sorry no results try again"
  else
    break
  end

end

# get all lyric result sections.
full_page = page.css('.sec-lyric')

arr = []

# iterate over each section retriving each attribute 
full_page.each do |item|

  title = item.css('.lyric-meta > p.lyric-meta-title > a').text
  artist = item.css('.lyric-meta > p.lyric-meta-artists > a').text
  album = item.css('.lyric-meta > p.lyric-meta-album > a').text
  year = item.css('.lyric-meta > p.lyric-meta-album-year > a').text
  lyrics = item.css('pre').text

	# create an instance of album for each item
	artist_info = Album.new
	artist_info.attributes({
	  artist: artist,
	  title: title,
	  album: album,
	  year: year,
	  lyrics: lyrics
	})


        # push the object to the array stack.
        arr.push(artist_info)
end


# iterate over the array retriving each object calling artist, title, album and
# year on them.
arr.each do |item|

  puts "---------------------------------------------------------------------"
  puts "artist: #{item.artist}"
  puts "title: #{item.title}"
  puts "album: #{item.album}"
  puts "year: #{item.year}"
  puts "#{blue(item.lyrics)}"

end









