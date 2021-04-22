require 'pg'

class Bookmark
  def self.all
    if ENV['ENV_RACK'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    bookmarks = connection.exec("SELECT * FROM bookmarks;")
    bookmarks.map { |bookmark| bookmark }
   
  end

  def self.create(url:, title:)
    if ENV['ENV_RACK'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else
      connection = PG.connect(dbname: 'bookmark_manager')
    end

    connection.exec("INSERT INTO bookmarks (url, title) VALUES('#{url}', '#{title}')")
  end
end
