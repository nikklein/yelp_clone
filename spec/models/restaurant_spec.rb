require 'spec_helper'

describe 'reviews' do
  describe 'build_with_user' do

    let(:user) { User.create email: 'test@test.com' }
    let(:restaurant) { Restaurant.create name: 'Test' }
    let(:review_params) { {rating: 5, thoughts: 'yum'} }

    subject(:review) { restaurant.reviews.build_with_user(review_params, user) }

    it 'builds a review' do
      expect(review).to be_a Review
    end

    it 'builds a review associated with the specified user' do
      expect(review.user).to eq user
    end

    describe '#average_rating' do
      context 'no reviews' do
        it 'returns "N/A" when there are no reviews' do
          restaurant = Restaurant.create(name: 'The Ivy')
          expect(restaurant.average_rating).to eq 'N/A'
        end
      end
      context '1 review' do
        it 'returns that rating' do
          # user = User.create(email: 'test@gmail.com', password:'123456')
          restaurant = Restaurant.new(name: 'The Ivy')#, user_id: user.id )
          restaurant.save(validate: false)
          review = restaurant.reviews.create(rating: 4)
          review.save(validate: false)
          expect(restaurant.average_rating).to eq 4
        end
      end
      context 'multiple reviews' do
        it 'returns the average' do
          restaurant = Restaurant.new(name: 'The Ivy')
          restaurant.save(validate: false)
          review = restaurant.reviews.create(rating: 1)
          review.save(validate: false)
          review2 =restaurant.reviews.create(rating: 5)
          review2.save(validate: false)
          expect(restaurant.average_rating).to eq 3
        end
      end
    end
  end
end
