require_relative '../lib/bookmark'

describe Bookmark do
  context 'when created' do
    it 'has a name' do
      expect(subject).to be_instance_of(Bookmark)
    end
  end

  context '#all' do
    it 'returns all bookmarks' do
      connection = PG.connect(dbname: 'bookmark_manager_test')

      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com/');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.destroyallsoftware.com');")
      connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.google.com/');")

      bookmarks = Bookmark.all
    
      expect(bookmarks).to include('http://www.makersacademy.com/')
      expect(bookmarks).to include('http://www.destroyallsoftware.com')
      expect(bookmarks).to include('http://www.google.com/')
    end
  end
end
