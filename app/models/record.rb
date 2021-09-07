class Record < ApplicationRecord
  belongs_to :exercise
  default_scope -> { order(created_at: :desc) }
  validates :weight, :reps_count, :RM, presence: true
  validates :weight, :reps_count, :RM, numericality: { greater_than: 0 }

  before_validation do
    self.RM = weight * ( reps_count / 40 + 1 )
  end

end
