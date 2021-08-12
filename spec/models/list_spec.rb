require 'rails_helper'

describe List, type: :model do
  it 'has a valid factory' do
    list = build(:list)
    expect(list).to be_valid
  end
end
