# Provide authentication credentials
@client = Octokit.configure do |c|
  c.login = ENV['LOGIN']
  c.password = ENV['PASSWORD']
end