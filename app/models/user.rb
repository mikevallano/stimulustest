class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :owned_lists, class_name: 'List', foreign_key: :owner_id
  has_many :memberships, foreign_key: :member_id
  has_many :member_lists, through: :memberships, source: :list

  def lists
    List
      .left_joins(:memberships)
      .where(lists: {owner: self})
      .or(Membership.where(member: self)).distinct
  end

  def movies
    Movie.joins(:listings).where(listings: {list: self.lists}).distinct
  end
end
