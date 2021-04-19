feature 'it display an index' do
  scenario 'it says Hello world' do
    visit('/')
    expect(page).to have_content 'Hello World!'
  end
end