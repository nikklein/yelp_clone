require 'rails_helper'
require 'timeout'
feature 'endorsing reviews' do

  before do
    sign_up
    create_restauarant
    leave_review("SO SO", 5)
  end

  scenario 'a user can endorse a review, which updates the review endorsement count', js: true do
    click_link "Endorse" #are we endorsing restaurants or the review of the restaurants?
    expect(page).to have_content('1 endorsement')
  end

  scenario 'counts a number of endorsements', js: true do
    click_link "Endorse"
    wait_for_ajax
    click_link "Endorse"
    wait_for_ajax
    click_link "Endorse"
    wait_for_ajax
    click_link "Endorse"
    expect(page).to have_content('4 endorsement')
  end


end
