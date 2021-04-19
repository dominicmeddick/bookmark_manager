feature 'it display bookmarks' do
  scenario 'i can see a bookmark' do
    visit('/')
    expect(page).to have_content 'http://google.com'
    expect(page).to have_content 'http://udemy.com'
  end
end