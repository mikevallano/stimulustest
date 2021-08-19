class Movie < ApplicationRecord
  validates :title, presence: true
  has_many :listings
  has_many :lists, through: :listings

  scope :for_user, -> (user) do
    joins(:listings).where(listings: {list: user.lists})
  end
end
