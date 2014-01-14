require 'sinatra'
require 'octokit'
require 'rdiscount'

REPOSITORY = 'scheduling'
ACCESS_TOKEN = 'YOUR_ACCESS_TOKEN'

get '/' do
  client = Octokit::Client.new access_token: ACCESS_TOKEN
  releases = client.repo("boxuk/#{ REPOSITORY }").rels[:releases].get.data
  erb :index, locals: { releases: releases }
end