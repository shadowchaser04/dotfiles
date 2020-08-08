#!/usr/bin/env ruby

require 'fileutils'
require 'pry'
require 'json'

# Takes arguments from the stdin and stores them in an array.

$input_array = ARGV

class GitApiHookup

    def initialize
        basedir = ENV["HOME"]
        @git_env = File.join(basedir, ".bin/git_init/env.json")
        @root_dir = Dir.pwd
        @address = "https://api.github.com/user/repos"
        @repo_name = $input_array[0]
    end

    def env
      # read the json file
      f = File.read(@git_env)

      person_hash = JSON.parse(f)
      return person_hash
    end

    # Authenticate and create a remote repository
    def init_remote_repo
        # set user name and git token
        binding.pry
        token = ENV['GIT_TOKEN']
        user_name = ENV['GIT_USERNAME']

        # Authenticate Username and Token
        auth = user_name + ":" + token
        account = "curl -s -u #{auth} -d"

        # Remote repo name
        setup="\'{\"name\": \"#{@repo_name}\", \"auto_init\"\: true}\'"
        repo = account + " " + setup + " " + @address

        return system(repo)
    end

    # create a local repo.
    def local_init
        begin
            FileUtils.cd("#{@root_dir}") do
              gra = "git remote add origin git@github.com:#{env['GIT_USERNAME']}/#{@repo_name}.git"

              system("git init")
              system("#{gra}")
              system("git pull origin master --rebase")
              system("git add .")
              system("git commit -m \'initial commit\'")
              system("git push -u origin master")
            end
        rescue => e
            puts "#{@root_dir}/#{@repo_name} does not exist"
        end
    end

end

# Instansiate repo
repo = GitApiHookup.new

# Create remote repo
repo.init_remote_repo

repo.local_init
