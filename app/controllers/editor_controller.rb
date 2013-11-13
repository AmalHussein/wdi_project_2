class EditorController < ApplicationController


  def index
 github = Github.new client_id: ENV['CLIENT_ID'] , client_secret: ENV['CLIENT_SECRET']
end


end 

