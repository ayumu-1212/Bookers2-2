class Book < ApplicationRecord
	belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_many :tags, dependent: :destroy
  accepts_nested_attributes_for :tags, allow_destroy: true


  validates :title, presence: true
  validates :body, length: {minimum: 1, maximum: 200}


  def liked_by?(user)
    likes.where(user_id: user.id).exists?
  end

end
