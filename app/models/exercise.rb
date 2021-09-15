class Exercise < ApplicationRecord
  belongs_to :user, optional: true
  has_many :records, foreign_key: "exercise_id", dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  validates :name, presence: true
  validates :name, length: { maximum: 30 }
end
