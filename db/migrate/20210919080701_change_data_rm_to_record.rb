class ChangeDataRmToRecord < ActiveRecord::Migration[6.0]
  def change
    change_column(:records, :RM, :decimal, precision:5, scale: 2)
  end
end
