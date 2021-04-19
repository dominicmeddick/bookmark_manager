require 'bookmark'

describe Bookmark do
  context '#.all' do
    it 'returns the bookmarks' do
      bookmarks = Bookmark.all

      expect(bookmarks).to include 'http://udemy.com'
      expect(bookmarks).to include 'http://google.com'
    end
  end
end