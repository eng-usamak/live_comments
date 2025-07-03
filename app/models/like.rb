class Like < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  
  validates :user_id, uniqueness: { scope: :comment_id, message: "can only like a comment once" }
end
