#------------------------------------------------------------------------------
# awsome print
#------------------------------------------------------------------------------

begin
  require 'amazing_print'
  AmazingPrint.pry!
  Pry.config.print = proc { |output, value| output.puts value.ai }
rescue LoadError => err
  puts "no awesome_print :("
end

def formatted_env
  case Rails.env
  when 'production'
    bold_upcased_env = Pry::Helpers::Text.bold(Rails.env.upcase)
    Pry::Helpers::Text.red(bold_upcased_env)
  when 'staging'
    Pry::Helpers::Text.yellow(Rails.env)
  when 'development'
    Pry::Helpers::Text.green(Rails.env)
  else
    Rails.env
  end
end

def app_name
  File.basename(Rails.root)
end

if defined?(Rails)
    Pry.config.prompt = Pry::Prompt.new(
    "custom",
    "my custom prompt",
    [proc { |obj, nest_level, _| "[#{app_name}][#{formatted_env}] #{obj}:#{nest_level}> " }]
    )
end

#------------------------------------------------------------------------------
# config
#------------------------------------------------------------------------------
Pry.config.editor = "vim"

Pry.config.pager = false

#------------------------------------------------------------------------------
# Indent
#------------------------------------------------------------------------------
# automatic indenting of input will occur.
Pry.config.auto_indent = false

# Pry.config.correct_indent is a boolean option determining whether 
# correction of indenting will occur (requires auto_indent to be set to true).
# Setting it to false disables correction.

Pry.config.correct_indent = true

#------------------------------------------------------------------------------
# color
#------------------------------------------------------------------------------
Pry.config.ls.heading_color = :magenta
Pry.config.ls.instance_var_color = :green
Pry.config.ls.public_method_color = :white
Pry.config.ls.protected_method_color = :yellow
Pry.config.ls.private_method_color = :bright_black

#------------------------------------------------------------------------------
# prompt
#------------------------------------------------------------------------------
# project base name
Pry.config.prompt_name = File.basename(Dir.pwd)

#------------------------------------------------------------------------------
# Exception reformatting
#------------------------------------------------------------------------------
Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "\001\e[0;37m\002=>\e[31m from #{exception.backtrace.first}\e[0m"
end

#------------------------------------------------------------------------------
# Last command
#------------------------------------------------------------------------------
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end

#------------------------------------------------------------------------------
# Aliases
#------------------------------------------------------------------------------
#Pry.commands.alias_command 'hi', 'hist -a'
Pry.commands.alias_command 'w', 'whereami'
Pry.commands.alias_command 'q', 'exit'

#hist -a == hist all
Pry.commands.alias_command 'HR', 'hist -a --replay', desc: "replay history - also takes a range HR 1..3"
Pry.commands.alias_command 'HH', 'hist -a -H', desc: "history with head - no args defaults to 10 - will take arg"
Pry.commands.alias_command 'HT', 'hist -a -T', desc: "history with tail - no args defaults to 10 - will take arg"
Pry.commands.alias_command 'HG', 'hist -a -G', desc: "history with grep - takes an arg <search term>"
Pry.commands.alias_command 'h', 'hist -a', desc: "full cross session history"

#Pry.commands.alias_command 'HE', 'hist --exclude'

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
  Pry.commands.alias_command 'b', 'break'
  Pry.commands.alias_command 'bda', 'break --disable-all'
end

#------------------------------------------------------------------------------
# Cheat sheet
#------------------------------------------------------------------------------
Pry::Commands.block_command('cheat', 'Display Cheatsheet') do
  puts '-----------------------------------------------------------------------'
  puts 'Shortcuts:'
  puts '-----------------------------------------------------------------------'
  puts '@ : whereami'
  puts '? : show-doc'
  puts '$ : show-source'
  puts '_ : Last eval'
  puts 'wtf? : Print the stack trace'
  puts 'nesting : like tree/dir stack gives nesting level'
  puts 'jump-to : jump-to with nesting we can identify an earlier context to jump back to'
  puts '-----------------------------------------------------------------------'
  puts 'Aliases:'
  puts '-----------------------------------------------------------------------'
  puts 'HH : hist head, defaults to 10. takes one arg - amount of head to crop'
  puts 'HT : hist tail, defaults to 10. takes one arg - amount of tail to crop'
  puts 'HR : hist replay, takes a arg - hist number, can also be a range 1..3'
  puts 'HG : hist grep, takes an arg - a search term'
  puts '-----------------------------------------------------------------------'
  puts 'Help:'
  puts '-----------------------------------------------------------------------'
  puts 'help - misc help'
  puts 'help <alias> -  See all the aliases available with description'
  puts 'help ls : Display command options for pry command ls'
  puts '-----------------------------------------------------------------------'
  puts 'Search'
  puts '-----------------------------------------------------------------------'
  puts 'show-method : <Class#method> – show source for a method'
  puts 'show-doc    : <Class#method> – show documentation for how method works'
  puts 'find-method : <search-text>  – list methods that match method-name'
end

#------------------------------------------------------------------------------
# repeat the last command by hitting the Enter key
#------------------------------------------------------------------------------
#Pry::Commands.command /^$/, "repeat last command" do
  #_pry_.run_command Pry.history.to_a.last
#end
#------------------------------------------------------------------------------
# Dir
#------------------------------------------------------------------------------
# Print (current) working directory
def pwd
  %x{pwd}.rstrip
end

# List all directories and hidden files
def la
  puts %x{ls -la}
end

# List only directories
def l
  puts %x{ls -l}
end

# pbcopy to the clipboard
Pry.config.commands.command 'pbcopy', 'Copy input to clipboard' do |input|
  input = input ? target.eval(input) : _pry_.last_result
  IO.popen('pbcopy', 'w') { |io| io << input }
end
#------------------------------------------------------------------------------
# History
#------------------------------------------------------------------------------
# load history on start up.
Pry.history.load

# Default history file.
Pry.config.history_file = "~/.cache/cache.txt"

# The Pry.config.history.should_save option determines whether history will
# be saved to the history file when a Pry session ends
Pry.config.history_save = true

# The Pry.config.history.should_load option determines whether history will
#be loaded from the history file when a Pry session starts.
Pry.config.history_load = true

# Change the history file to ~/.irb_history
#Pry.config.history.file = "~/.irb_history"

def search_history(filter)
    puts `cat ~/.pry_history | grep "#{filter}"`
end

