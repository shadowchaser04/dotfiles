#!/usr/bin/env ruby

require 'pry'

class LookFor
    def initialize(search_term)
        @search_term = search_term
        @source = Array.new
        @dir = File.dirname(__FILE__)
    end

    def clean(arg)
      if arg.class == String && !arg.empty?
          arg.split.join(" ").downcase
      else
        return arg
      end
    end

    def write_to_file
            filename = @source[0] + ".txt"
            # open and write to a file with ruby
            File.open(filename, "w+") do |f|
                @source.each { |element| f.puts(element) }
            end
        end

    # read each word of the dictinary file in to the dictinary array.
    def read_file(source_file)
        begin
            file = File.join(@dir, source_file)
            File.readlines(file).each do |line|
                @source << clean(line)
            end
        rescue Errno::ENOENT 
            puts "Error: There is a problem reading the dictinary file at this location: #{file}"
        end
    end

    # search the array for the search term using match, this essentialy creates 
    # a new array pushhing all matches to it.
    def search
        @source.keep_if {|word| word =~ /#@search_term/ }
    end

    # count each item in the new array.
    def count_results
        return search.count
    end

    # return the length of the longest word.
    def longest_word
        @source.max_by(&:length)
    end
end

#------------------------------------------------------------------------------
# methods for options
#------------------------------------------------------------------------------

def dictinary_menu(input)
    d = LookFor.new(input)
    d.read_file("dictinary.txt")
    puts d.search
    puts "-------------------------------"
    puts "word(s) retured" + " " + "#{d.count_results}"
    if d.longest_word.nil?
        puts "there are no results for #{input}"
    else
        puts "longest word is #{d.longest_word.chomp.length} letters long: #{d.longest_word}"
    end
    puts "-------------------------------"
    d.write_to_file
end

def names_menu(input)
    n = LookFor.new(input)
    n.read_file("names.txt")
    puts n.search
    puts "-------------------------------"
    puts "name(s) retured" + " " + "#{n.count_results}"
    if n.longest_word.nil?
        puts "there are no results for #{input}"
    else
        puts "longest name is #{n.longest_word.chomp.length} letters long: #{n.longest_word}"
    end
    puts "-------------------------------"
end

def cars_menu(input)
    c = LookFor.new(input)
    c.read_file("cars.txt")
    puts c.search
    puts "-------------------------------"
    puts "cars(s) retured" + " " + "#{c.count_results}"
    if c.longest_word.nil?
        puts "there are no results for #{input}"
    else
        puts "longest name is #{c.longest_word.chomp.length} letters long: #{c.longest_word}"
    end
    puts "-------------------------------"
end

def counties_menu(input)
    c = LookFor.new(input)
    c.read_file("counties.txt")
    puts c.search
    puts "-------------------------------"
    puts "countie(s) retured" + " " + "#{c.count_results}"
    puts "-------------------------------"
end

def countrys_menu(input)
    c = LookFor.new(input)
    c.read_file("countrys.txt")
    puts c.search
    puts "-------------------------------"
    puts "countie(s) retured" + " " + "#{c.count_results}"
    puts "-------------------------------"
end


def languages_menu(input)
    l = LookFor.new(input)
    l.read_file("language.txt")
    puts l.search
    puts "-------------------------------"
    puts "languages(s) retured" + " " + "#{l.count_results}"
    if l.longest_word.nil?
        puts "there are no results for #{input}"
    else
        puts "longest name is #{l.longest_word.chomp.length} letters long: #{l.longest_word}"
    end
    puts "-------------------------------"
end
# set a boolean value to true for the loop
run = true

# loop through the options until exit is selected
while run == true

        puts "choose\n 1) dictinary\n 2) names\n 3) cars\n 4) counties\n 5) country\n 6) languages\n 7) exit\n"
        opt = gets
        options = opt.chomp
        
        case options
        when "1"
            puts "search:"
            user = gets
            user_search = user.chomp
            dictinary_menu(user_search)
        when "2"
            puts "search:"
            user = gets
            user_search = user.chomp
            names_menu(user_search)
        when "3"
            puts "search:"
            user = gets
            user_search = user.chomp
            cars_menu(user_search)
        when "4"
            puts "search:"
            user = gets
            user_search = user.chomp
            counties_menu(user_search)
        when "5"
            puts "search:"
            user = gets
            user_search = user.chomp
            countrys_menu(user_search)
        when "6"
            puts "search:"
            user = gets
            user_search = user.chomp
            languages_menu(user_search)
        when "7"
            run = false
        end

end
