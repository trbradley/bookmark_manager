feature 'Adding tags' do
  # As a time-pressed user
  # So that I can organise my many links into different categories for ease of search
  # I would like to tag links in my bookmark manager
  scenario 'adding a single tag to a link' do
    visit '/links/new'
    fill_in 'url', with: 'http://www.google.com'
    fill_in 'title', with: 'Google'
    fill_in 'tag', with: 'search'
    click_button 'Submit'

    link = Link.first
    expect(link.tags.map(&:name)).to include('search')
    # within 'ul#links' do
    #   expect(page).to have_content 'search'
    # end
  end
end
