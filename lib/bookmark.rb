require 'pg'

class Bookmark
  def self.all
    if ENV['ENV_RACK'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    bookmarks = connection.exec("SELECT * FROM bookmarks;")
    bookmarks.map { |bookmark| bookmark['url'] }
  end

  def self.create(url:)
    if ENV['ENV_RACK'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url) VALUES('#{url}')")
  end
end
