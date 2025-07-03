class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :parent, class_name: 'Comment', optional: true
  
  has_many :replies, class_name: 'Comment', foreign_key: 'parent_id', dependent: :destroy
  has_many :likes, dependent: :destroy
  
  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
  
  scope :not_deleted, -> { where(deleted_at: nil) }
  scope :deleted, -> { where.not(deleted_at: nil) }
  
  def soft_delete!
    update!(deleted_at: Time.current)
  end
  
  def deleted?
    deleted_at.present?
  end
  
  def liked_by?(user)
    likes.exists?(user: user)
  end
  
  def like_count
    likes.count
  end
end
