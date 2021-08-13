class List < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  validates :name, presence: true
  validates :name, uniqueness: {scope: :owner}

  has_many :listings
  has_many :movies, through: :listings
end
