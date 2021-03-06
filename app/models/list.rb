class List < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  validates :name, presence: true
  validates :name, uniqueness: {scope: :owner}

  has_many :listings
  has_many :movies, through: :listings
  has_many :memberships
  has_many :members, through: :memberships, class_name: 'User'

  scope :for_user, -> (user) do
    left_joins(:memberships)
    .where(lists: {owner: user})
    .or(Membership.where(member: user)).distinct
  end
end
