class Listing < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  belongs_to :creator, class_name: 'User'
end
