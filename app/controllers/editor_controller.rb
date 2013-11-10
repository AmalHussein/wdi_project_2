class EditorController < ApplicationController


  def index
    Octokit.configure do |c|
      c.login = ENV['LOGIN']
      c.password = ENV['PASSWORD']
    end
  end
end
