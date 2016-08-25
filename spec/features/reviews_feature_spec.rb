require 'rails_helper'

feature 'reviewing' do

  before do
    sign_up
    create_restauarant
  end

  scenario 'allows users to leave a review using a form' do
     click_link 'Review KFC'
     fill_in "Thoughts", with: "so so"
     select '3', from: 'Rating'
     click_button 'Leave Review'

     expect(current_path).to eq '/restaurants'
     expect(page).to have_content('so so')
  end

  scenario 'displays an average rating for all reviews' do
    leave_review('So so', '3')
    sign_out
    click_link 'Sign up'
    fill_in "Email", with: 'mail2@mail.com'
    fill_in "Password", with: 'secret'
    fill_in "Password confirmation", with: 'secret'
    click_button 'Sign up'
    leave_review('Great', '5')
    expect(page).to have_content('Average rating: ★★★★☆')
  end



end
