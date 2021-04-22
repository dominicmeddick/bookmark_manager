require 'bookmark'
require 'pg'

describe Bookmark do
  context '#.all' do
    it 'returns the bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.makersacademy.com', 'Education');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.destroyallsoftware.com', 'Software');")
      connection.exec("INSERT INTO bookmarks (url, title) VALUES ('http://www.google.com', 'General');")

      bookmarks = Bookmark.all
      p bookmarks
      expect(bookmarks[0].to_s).to include "http://www.makersacademy.com"
      expect(bookmarks[1].to_s).to include "http://www.destroyallsoftware.com"
      expect(bookmarks[2].to_s).to include "http://www.google.com"
    end
  end
  context '#create' do
    it 'creates a bookmark' do
      Bookmark.create(url: 'http://www.youtube.com', title: 'General')

      expect(Bookmark.all.to_s).to include 'http://www.youtube.com'
      expect(Bookmark.all.to_s).to include 'General'
    end
  end
end
