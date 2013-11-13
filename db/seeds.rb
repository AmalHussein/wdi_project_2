repo_1 = Repo.create(repo_name: "wdi_project_2", repo_username: "AmalHussein")
repo_2 = Repo.create(repo_name: "Coffee_Project", repo_username: "ChrisSherlin")

gem_1 = Gemm.create(name: "pry", documentation_url: "http://pryrepl.org", description: "More than an IRB replacement", downloads: "10000", version: "1.0.0", category: "development")
gem_2 = Gemm.create(name: "rails", documentation_url: "http://railscasts.com", description: "Open source ", downloads: "1000000", version: "4.0.0", category: "web development")
gem_3 = Gemm.create(name: "faker", documentation_url: "http://faker.rubyforge.org", description: "Easily generate fake data", downloads: "2300", version: "1.0.1", category: "data propagation")
gem_4 = Gemm.create(name: "twitter", documentation_url: "https://github.com/sferik/twitter", description: "A Ruby interface to the Twitter API", downloads: "5000", version: "3.0.0", category: "API")

res_1 = Resource.create(site_name: "Railscasts", site_url: "http://railscasts.com/episodes/126-populating-a-database")
res_2 = Resource.create(site_name: "Rails Guides", site_url: "http://guides.rubyonrails.org")
res_3 = Resource.create(site_name: "Synaptian", site_url: "http://www.synaptian.com/blog/posts/using-the-twitter-gem-in-your-rails-application")
res_4 = Resource.create(site_name: "Lucapette", site_url: "http://lucapette.com/pry/pry-everywhere/")

repo_1.gemms << gem_1
repo_1.gemms << gem_2
repo_1.gemms << gem_3
repo_1.gemms << gem_4

repo_2.gemms << gem_1
repo_2.gemms << gem_2
repo_2.gemms << gem_3
repo_2.gemms << gem_4

gem_1.resources << res_1
gem_1.resources << res_2
gem_1.resources << res_3
gem_1.resources << res_4