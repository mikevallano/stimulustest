class Membership < ApplicationRecord
  belongs_to :list
  belongs_to :member, class_name: 'User'
end
