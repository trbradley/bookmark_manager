def sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'example@example.com'
  fill_in :password, with: 'qwerty'
  fill_in :password_confirmation, with: 'qwerty'
  click_button 'Sign up'
end

def invalid_sign_up
  visit '/users/new'
  expect(page.status_code).to eq(200)
  fill_in :email,    with: 'example@example.com'
  fill_in :password, with: 'qwerty'
  fill_in :password_confirmation, with: 'notqwerty'
  click_button 'Sign up'
end

def no_email_sign_up
  visit '/users/new'
  # fill_in :email,    with: 'example@example.com'
  fill_in :password, with: 'qwerty'
  fill_in :password_confirmation, with: 'qwerty'
  click_button 'Sign up'
end
