class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	has_many :books, dependent: :destroy
  accepts_nested_attributes_for :books, allow_destroy: true

  has_many :book_comments, dependent: :destroy

  has_many :likes, dependent: :destroy
  has_many :liked_books, through: :likes, source: :book

  has_many :relationships, class_name: "Relationship", foreign_key: "user_id"
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user

	attachment :profile_image

  validates :name, length: {minimum: 2, maximum:20}
  validates :introduction, length: {maximum: 50}


  def follow?(user)
    followers.where(id: user.id).exists?
  end

end
