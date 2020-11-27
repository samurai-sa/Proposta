class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  validates  :comment, {presence: true}
end
