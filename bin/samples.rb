#!/usr/bin/env ruby

require 'pry'
require 'mechanize'

# color the text
def blue(term)
  "\e[34m #{term} \e[0m"
end

def red(term)
  "\e[31m #{term} \e[0m"
end

exit_loop = false

while exit_loop == false

  puts "please select sample\:\>"
  user_input = gets.chomp

  # create an instance of mechanize, in this case agent.
  # then use the get method to retrive the page.
  agent = Mechanize.new
  page = agent.get('https://www.whosampled.com/')

  # find the specific form on the page used to submit my search request.
  search_form = page.form_with(:method => 'GET')

  # provide the search term to the form
  search_form.q = user_input

  # submit the search request
  page = agent.submit(search_form)

  # create a hash with array as values
  result = Hash.new { |h, k| h[k] = [] }

  # create an array, this is used to push the nokogiri element into. so it can
  # be iterated back out and picked for its css elements.
  data = []

  if page.at_css("p").text =~ /No results for your search/
    puts "#{red("No results for your search: Please try again")}"
  else
    data << page.at_css(".layout-container")

    # loop throught the data retriving each element.
    data.each do |item|
      # ---------------------------------------------------------------------------
      # top hit
      # ---------------------------------------------------------------------------
      # hash key tophit
      result[:tophit]

      # css elements
      tophit_title = item.css(".topHit > .title > a")
      tophit_counts = item.css(".topHit > .title > span.trackArtist")

      # push the results to the hash result with key tophit as array values.
      (result[:tophit] ||=[]) << tophit_title.text + " " + tophit_counts.text

      # ---------------------------------------------------------------------------
      # artist
      # ---------------------------------------------------------------------------
      # select all the artist info tags then iterate over the array selecting both
      # the count and the artist.
      artist_info = item.css("ul.list > li.artistEntry > span.artistInfo")

      # create the key artist
      result[:artist]

      artist_info.each do |list|
        artist_name = list.css("span.artistName > a")
        artist_counts = list.css("span.counts")
        (result[:artist] ||=[]) << artist_name.text + " " + artist_counts.text
      end
      # ---------------------------------------------------------------------------
      # Tracks
      # ---------------------------------------------------------------------------
      # listEntry trackEntry
      # trackDetails > a
      # trackArtist > a
      track_info = item.css("ul.list > li.trackEntry")

      # create a key track
      result[:track]

      track_info.each do |list|
        track_name = list.css("span.trackDetails > a")
        track_artist = list.css("span.trackDetails > span.trackArtist")
        (result[:track] ||=[]) << track_name.text + " " + track_artist.text
      end

      # ---------------------------------------------------------------------------
      # conections
      # ---------------------------------------------------------------------------
      # li.sampleCompactEntry
      # span.connectionTitle
      connection_info = item.css("ul.list > li.sampleCompactEntry")

      # create a key connection
      result[:connection]

      connection_info.each do |list|
        track_name = list.css("span.connectionTitle > a")
        (result[:connection] ||=[]) << track_name.text
      end

      # iterate over the hash. on the value use a nested loop to iterate over
      # each item of the array.
      result.each_pair do |key, value|
          puts "key: #{key}"
          value.each_with_index do |item,index|
          puts "#{index}\) #{blue(item)}"
          end
      end
    end
    
  end


end
