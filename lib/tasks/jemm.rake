require 'gems'

namespace :gemlist do
  desc "Mine all info on documented gems at rubygems.org"
  task mine_all: :environment do
    gemlist = []
    gemfile = Rails.root + 'lib/tasks/gemfile.txt'
    File.open(gemfile, 'r') do |f|
      f.each_line { |line| gemlist << line.split(' ').first }
    end

    gemlist.each do |jem|
      begin
        gem_digest = Gems.search(jem).first
        puts "Importing: #{gem_digest["name"]}"
        Gemm.create( real_name: jem , name: gem_digest["name"], 
                    documentation_url: gem_digest["documentation_uri"], 
                    description: gem_digest["info"], 
                    downloads: gem_digest["downloads"], 
                    version: gem_digest["version"], 
                    version_downloads: gem_digest["version_downloads"],
                    platform: gem_digest["platform"],
                    gem_uri: gem_digest["gem_uri"],
                    homepage_uri: gem_digest["homepage_uri"],
                    wiki_uri: gem_digest["wiki_uri"], 
                    documentation_uri: gem_digest["documentation_uri"],
                    mailing_list_uri: gem_digest["mailing_list_uri"],
                    source_code_uri: gem_digest["source_code_uri"],
                    bug_tracker_uri: gem_digest["bug_tracker_uri"], 
                    project_url: gem_digest["project_uri"]
                      )
      rescue Exception => e
        puts "Oh noes! Smthng wends wayward"
        puts "The exception is #{e.message}"
        puts jem
        next
      end
    end
  end
end
