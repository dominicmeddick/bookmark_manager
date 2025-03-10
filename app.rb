require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb :index
  end

  get '/bookmark' do
    @bookmarks = Bookmark.all
    erb :bookmark
  end

  post '/add' do
    Bookmark.create(url: params[:url], title: params[:title])
    redirect '/'
  end

  run! if app_file == $0
end
