class TagContent < ApplicationRecord
  has_many :tags, dependent: :destroy
  has_many :public_descriptions, dependent: :destroy
  accepts_nested_attributes_for :public_descriptions, allow_destroy: true

end
