feature 'bookmarks allows the user' do
  scenario 'to view all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com/"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com/"
  end
end
