class Prototype < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  validates :image, presence: true
  validates :title, presence:true
  has_many :comments,dependent: :destroy
end