feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/')
    fill_in('url', with: 'http://www.google.com')
    fill_in('title', with: 'General')
    click_button('Submit')
    click_button('View Bookmarks')

    # expect(page).to have_content 'http://www.google.com'
    expect(page).to have_content 'General'
  end
end
