require 'sinatra'
require 'octokit'
require 'rdiscount'

ACCESS_TOKEN = 'YOUR_ACCESS_TOKEN'

get '/' do
  erb :layout do
    erb :index
  end
end

get '/:owner/:repository' do
  client = Octokit::Client.new access_token: ACCESS_TOKEN
  releases = client.repo("#{ params[:owner] }/#{ params[:repository] }").rels[:releases].get.data
  erb :layout do
    erb :repository, locals: { releases: releases }
  end
end
