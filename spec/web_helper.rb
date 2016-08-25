def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: 'mail@mail.com'
  fill_in 'Password', with: 'topsecret'
  fill_in 'Password confirmation', with: 'topsecret'
  click_button 'Sign up'
end

def create_restauarant
  click_link 'Add a restaurant'
  fill_in 'Name', with: 'KFC'
  fill_in 'Description', with: 'GOOD'
  click_button 'Create Restaurant'
end

def sign_out
  click_button 'Sign out'
end
