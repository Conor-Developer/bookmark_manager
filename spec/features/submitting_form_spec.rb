feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'www.twitch.com')
    click_button('Submit')
    expect(page).to have_content 'www.twitch.com'
  end
end
