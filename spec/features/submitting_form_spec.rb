feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.twitch.com')
    fill_in('title', with: 'Twitch')
    click_button('Submit')
    expect(page).to have_link('Twitch', href: 'https://www.twitch.com')
  end
end
