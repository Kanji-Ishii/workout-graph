class Record < ApplicationRecord
  belongs_to :exercise
  default_scope -> { order(created_at: :desc) }
  validates :weight, :rep_count, :RM, presence: true
  validates :weight, :rep_count, :RM, numelicality: { greater_than: 0 }
end
