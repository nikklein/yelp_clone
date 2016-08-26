require 'rails_helper'

feature 'endorsing reviews' do

  before do
    sign_up
    create_restauarant
    leave_review("SO SO", 5)
  end

  scenario 'a user can endorse a review, which updates the review endorsement count' do
    click_link "Endorse Review" #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

  scenario 'counts a number of endorsements' do
    10.times{click_link "Endorse Review"}
    expect(page).to have_content('10 endorsement')
  end


end
