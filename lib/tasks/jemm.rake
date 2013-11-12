namespace :jemm do
  desc "Mine all info on documented gems at rubygems.org"
  task mine_all: :environment do |t|
    gemlist = []
    gemfile = Rails.root + 'lib/tasks/gemfile.txt'
    File.open(gemfile, 'r') do |f|
      f.each_line { |line| gemlist << line.split(' ').first }
    end

    gemlist.each do |jem|
      begin
        gem_digest = Gems.search(jem).first
        Gemm.create(name: gem_digest['name'], documentation_url: gem_digest['documentation_uri'], description: gem_digest['info'], downloads: gem_digest[index]['downloads'], authors: gem_digest['authors'], project_url: gem_digest['project_uri'], dependencies: gem_digest['dependencies'], language: 'ruby', cosa: 'gem')
      rescue
        puts "Oh noes! Smthng wends wayward"
        puts jem
        next
      end
    end
  end
end