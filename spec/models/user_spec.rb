describe('User') do
  before do
      Restaurant.create(name: 'KFC')
  end
it { is_expected.to have_many :reviewed_restaurants}
end
