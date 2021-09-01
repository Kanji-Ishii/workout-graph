class User < ApplicationRecord
  has_many :exercises
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
