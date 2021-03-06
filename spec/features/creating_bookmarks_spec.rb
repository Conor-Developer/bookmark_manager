feature 'Raise error with invalid URL' do
  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('title', with: 'not a real bookmark')
    fill_in('url', with: 'not a real url')
    click_button('Submit')

    expect(page).not_to have_content("not a real bookmark")
    expect(page).to have_content "You must submit a valid URL."
  end
end