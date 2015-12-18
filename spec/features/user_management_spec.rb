feature 'User sign up' do
  scenario 'I can sign up as a new user' do
    expect { sign_up }.to change(User, :count).by(1)
    expect(page).to have_content('Welcome, example@example.com')
    expect(User.first.email).to eq('example@example.com')
  end

  scenario 'signing up without password confirmation fails' do
    expect { invalid_sign_up }.not_to change(User, :count)
  end
end
