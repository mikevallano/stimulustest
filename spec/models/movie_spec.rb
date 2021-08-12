require 'rails_helper'

describe Movie, type: :model do
  it 'has a valid factory' do
    movie = create(:movie)
    expect(movie).to be_valid
  end
end
