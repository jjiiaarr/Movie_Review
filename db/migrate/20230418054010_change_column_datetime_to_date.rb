class ChangeColumnDatetimeToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :movies, :date_released, :date
    change_column :movies, :showing_start, :date
    change_column :movies, :showing_end, :date
  end
end
