class Record < ApplicationRecord
  belongs_to :exercise
  default_scope -> { order(created_at: :desc) }
  validates :weight, :reps_count, :RM, presence: true
  validates :weight, :reps_count, :RM, numericality: { greater_than: 0 }

  before_validation do
    self.RM = weight / ( ( 102.89 - 2.9119 * reps_count + 0.0319 * reps_count ** 2 - 0.000035399 * reps_count ** 3 ) / 100 )
  end
end
