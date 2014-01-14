require 'sinatra'
require 'octokit'
require 'rdiscount'

ACCESS_TOKEN = ENV['GITHUB_ACCESS_TOKEN']

get '/' do
  erb :index
end

get '/:owner/:repository' do
  owner, repository = params[:owner], params[:repository]
  client    = Octokit::Client.new(access_token: ACCESS_TOKEN)
  @releases = client.repo("#{ owner }/#{ repository }").rels[:releases].get.data
  erb :repository
end
