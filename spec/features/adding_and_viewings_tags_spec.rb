feature 'Adding and viewings tags' do
  feature 'a user can add and then view tags for each bookmark' do
    xscenario 'a tag is added to a bookmark' do
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')

      visit('/bookmarks')
      first('.bookmark').click_button 'Add Tag'

      expect(current_path).to eq "/bookmarks/#{bookmark.id}/tags/new"
      fill_in 'tag', with: 'Education'
      click_button 'Submit'

      expect(current_path).to eq '/bookmarks'
      expect(first('.bookmarks')).to have_content 'Education'
    end
  end
end
