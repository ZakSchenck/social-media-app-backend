class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :comment, optional: true
  has_many :likes

  def comments
    Comment.where(parent_id: id)
  end
end
