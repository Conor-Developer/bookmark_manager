feature 'Update bookmark' do
  it'to update the information of an existing bookmark' do
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    first('.bookmark').click_button 'Update'

    expect(current_path).to eq '/bookmarks/update'
    fill_in('title', with: 'BBC')
    fill_in('url', with: 'http://www.bbc.co.uk')
    click_button('Submit')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
end
