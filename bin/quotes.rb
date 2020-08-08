#!/usr/bin/env ruby

require 'pry'
require 'mechanize'

# color the text
def blue(term)
  "\e[34m #{term} \e[0m" 
end

# set the variable used for the loop, the first loop uses a break to exit so is
# only for the condition.
exit_loop = false

# create an instance of mechanize, in this case agent.
# then use the get method to retrive the page. 
agent = Mechanize.new
page = agent.get('http://www.subzin.com/')

# find the specific form on the page used to submit my search request.
google_form = page.form_with(:method => 'GET')


while exit_loop == false

  puts "----------------------------------------------------------------------"
  puts "please enter quote\:\>"

  # take user input
  user_input = gets.chomp

  # provide the search term to the form downcasing all the letters first them
  # titleizing them.
  google_form.q = user_input.downcase

  # submit the form with the chosen search term. if the search term produces no
  # response it will cause an exception, the  begin method rescues this and it 
  # loops back round, if there is a response to the search it will move on to 
  # the break and exits the while loop.
  begin
    page = agent.submit(google_form)
    break
  rescue 
    puts "user input ivalid - try again"
  end

end

full_page = page.css('li.odd')

# remap the full page which was a list containing multiple ul items on the
# items. this will create an array or ul items which will be the individul
# returned results specific to that movie.
unorderd = full_page.map {|items| items.css('ul.phrases') }

# create a hash
movies = {}

# iterate over the movies ul retriving the movie title, year and quote.
unorderd.each do |item|

  # movie title
  title = item.css('li > .title > h3').text

  # movie quote
  quote = item.css('li > div[data-role] > p > i > a[href]').text

  # create a hash with the movie name as the key and the quote as the value.
  movies[title] = quote

end

puts "------------------------------------------------------------------------"
puts "                            Quote Look-Up                               "
puts "------------------------------------------------------------------------"

# iterate over the hash also adding a index, this index is then used by the
# user to pick the movie they want to open in imdb.
movies.each_with_index { |(key,value),index| puts "#{index}) #{blue(key)} -> #{value} \n" }

arr = []

# add each key to the array so an index can be used
movies.each_key {|key| arr << key }


# take a user input
while exit_loop == false

  puts "please select a movie by number\:\>"
  user_input = gets.chomp

  # validate the first digit is a number
  if user_input =~ /[0-9]/
    
    # imdb link look up
    agent = Mechanize.new
    page = agent.get('https://www.imdb.com/')

    # find the specific form on the page used to submit my search request.
    google_form = page.form_with(:method => 'GET')

    # provide the search term to the form, this is provided by using the index from
    # the array. using the movie name to search imdb.
    google_form.q = arr[user_input.to_i]

    # submit the form with the chosen search term.
    page = agent.submit(google_form)

    # open the url if the page is a https url
    if page.uri.class == URI::HTTPS 
      system("open", page.uri.to_s)
      break
    end

  else
    puts "must be a number - muppet"

  end

end



