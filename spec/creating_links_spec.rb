feature 'create a new link' do
  scenario 'submit form for new link' do
    visit '/links/new'
    fill_in "url", with: 'http://www.google.com'
    fill_in('title', :with => 'Google')
    click_button("Submit")
    within 'ul#links' do
    expect(page).to have_content "Google"
  end
 end
end
