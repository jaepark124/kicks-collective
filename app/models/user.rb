class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :shoes, dependent: :destroy
  has_one :inventory, dependent: :destroy
  has_many :comments, dependent: :destroy
end
