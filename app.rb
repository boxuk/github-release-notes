require 'sinatra'
require 'octokit'
require 'rdiscount'

ACCESS_TOKEN = 'YOUR_ACCESS_TOKEN'

get '/' do
  erb :index
end

get '/:repository' do
  client = Octokit::Client.new access_token: ACCESS_TOKEN
  releases = client.repo("boxuk/#{ params[:repository] }").rels[:releases].get.data
  erb :repository, locals: { releases: releases }
end