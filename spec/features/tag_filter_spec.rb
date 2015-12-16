feature 'filtering by tags' do
  scenario 'it must allow a user to filter their links by tags' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'bubbles'
    click_button 'Submit'
    visit '/links/new'
    fill_in 'url', with: 'http://www.facebook.com'
    fill_in 'title', with: 'Facebook'
    fill_in 'tag', with: 'Social'
    click_button 'Submit'
    visit '/tags/bubbles'
    expect(page).to have_content('http://www.google.com')
    expect(page).to_not have_content('http://www.facebook.com')
  end
end
