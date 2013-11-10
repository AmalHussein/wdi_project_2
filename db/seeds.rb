# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.firstgemrence.create(gem_name: 'Py', resource_ur: 'http://rdoc.info/github/pry/pry/master/Pry')








Reference.create(gem_name: 'Devise', url: 'https://github.com/plataformatec/devise', category: 'logins', frequency: 'normal')
Reference.create(gem_name: 'Octokit', url: 'http://rdoc.info/github/pry/pry/master/Pry', category: 'API', )
Reference.create(gem_name: 'DoorKeeper', :url 'http://www.rubyflow.com/items/7746-screencast-oauth-2-with-doorkeeper', category: 'logins')
Reference.create(gem_name: 'Kaminari', :url 'http://railscasts.com/episodes/254-pagination-with-kaminari' , category: 'paginator')
Reference.create(gem_name: 'factory_girl', :url 'https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md' , category: 'misc')
Reference.create(gem_name: 'RMagick', :url 'http://rmagick.rubyforge.org/', category:'images')
Reference.create(gem_name: 'capybara', :url 'https://github.com/jnicklas/capybara', category: 'testing')

