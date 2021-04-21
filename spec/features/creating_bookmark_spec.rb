feature 'Adding a new bookmark' do
  scenario 'A user can add a bookmark to Bookmark Manager' do
    visit('/')
    fill_in('url', with: 'http://www.google.com')
    click_button('Submit')
    click_button('View Bookmarks')

    expect(page).to have_content 'http://www.google.com'
  end
endgit 