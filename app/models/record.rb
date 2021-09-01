class Record < ApplicationRecord
  belongs_to :user
  
  validates :name, :weight, :rep_count, :RM, presence: true
  validates :name, length: {maximum: 30}
  validates :weight, :rep_count, :RM, numelicality: {greater_than: 0}
end
