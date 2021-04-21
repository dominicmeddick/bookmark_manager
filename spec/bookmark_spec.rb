require 'bookmark'
require 'pg'

describe Bookmark do
  context '#.all' do
    it 'returns the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com');")


      bookmarks = Bookmark.all

      expect(bookmarks).to include "http://www.makersacademy.com"
      expect(bookmarks).to include "http://www.destroyallsoftware.com"
      expect(bookmarks).to include "http://www.google.com"
    end
  end
  context '#create' do
    it 'creates a bookmark' do
      Bookmark.create(url: 'http://www.youtube.com')

      expect(Bookmark.all).to include 'http://www.youtube.com'
    end
  end
end
