require 'pg'

feature 'Viewing bookmarks' do
  scenario 'A user can see bookmarks' do
    Bookmark.create(url: "http://www.makersacademy.com", title: "Makers")
    Bookmark.create(url: "hhttp://www.destroyallsoftware.com", title: "Software")
    Bookmark.create(url: "http://www.google.com", title: "General")

    visit('/bookmark')

    # expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "Makers"
    # expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "Software"
    # expect(page).to have_content "http://www.google.com"
    expect(page).to have_content "General"
  end
end
