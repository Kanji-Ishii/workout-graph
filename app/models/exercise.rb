class Exercise < ApplicationRecord
  belongs_to :user, optional: true
  has_many :records
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
