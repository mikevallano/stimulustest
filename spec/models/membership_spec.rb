require 'rails_helper'

describe Membership, type: :model do
  it 'has a valid factory' do
    membership = build(:membership)
    expect(membership).to be_valid
  end
end
