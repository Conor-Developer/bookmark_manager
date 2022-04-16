require_relative '../lib/bookmark'
require_relative 'database_helpers'

describe Bookmark do

  context '#all' do
    it 'returns all bookmarks' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
      Bookmark.create(url: 'http://www.google.com/', title: 'Google')

      bookmarks = Bookmark.all
    
      expect(bookmarks.length).to eq 3
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  context '#create' do
    it 'creates a new bookmark' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)
      
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first['id']
      expect(bookmark.title).to eq 'BBC'
      expect(bookmark.url).to eq 'http://www.bbc.co.uk'
    end

    it 'does not create a new bookmark if the URL is not valid' do
      Bookmark.create(url: 'not a real url', title: 'not a real bookmark')
      expect(Bookmark.all).to be_empty
    end
  end

  context '#delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.bbc.co.uk', title: 'BBC')
      Bookmark.delete(id: bookmark.id)
      persisted_data = persisted_data(table: 'bookmarks', id: bookmark.id)

      expect(persisted_data.first).to eq(nil)
    end
  end

  context '#update' do
    it 'updates an existing bookmark' do
      bookmark = Bookmark.create(url: 'http://bbc.co.uk', title: 'BBC')
      updated_bookmark = Bookmark.update(id: bookmark.id, url: 'http://www.makersacademy.com', title: 'Makers Academy')

      expect(updated_bookmark).to be_a Bookmark
      expect(updated_bookmark.id).to eq bookmark.id
      expect(updated_bookmark.url).to eq 'http://www.makersacademy.com'
      expect(updated_bookmark.title).to eq 'Makers Academy'
    end
  end

  context '#find' do
    it 'returns the requested bookmark object' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')

      result = Bookmark.find(id: bookmark.id)

      expect(result).to be_a Bookmark
      expect(result.id).to eq bookmark.id
      expect(result.title).to eq 'Makers Academy'
      expect(result.url).to eq 'http://www.makersacademy.com'
    end
  end

  context '#comments' do

    let(:comment_class) { double(:comment_class) }

    it 'calls .where on the Comment class' do
      bookmark = Bookmark.create(title: 'Makers Academy', url: 'http://www.makersacademy.com')
      expect(comment_class).to receive(:where).with(bookmark_id: bookmark.id)

      bookmark.comments(comment_class)
    end
  end
end
