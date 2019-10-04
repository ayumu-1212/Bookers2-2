class Tag < ApplicationRecord
  belongs_to :tag_content
  belongs_to :book
  has_many :private_descriptions, dependent: :destroy
  accepts_nested_attributes_for :private_descriptions, allow_destroy: true

end
