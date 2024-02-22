class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         validates :user_name, presence: true
         validates :email, presence: true
         validates :encrypted_password, presence: true
         validates :profile, presence: true
         validates :post, presence: true
         validates :affilication, presence: true
         has_many :prototypes,dependent: :destroy
         has_many :comments, dependent: :destroy

end
