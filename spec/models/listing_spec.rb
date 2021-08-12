require 'rails_helper'

describe Listing, type: :model do
  it 'has a valid factory' do
    listing = build(:listing)
    expect(listing).to be_valid
  end
end
