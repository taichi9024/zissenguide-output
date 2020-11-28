class ChangeColumnToAllowNull < ActiveRecord::Migration[6.0]
  def change
    change_column :staff_members, :end_date, :date, null: true
  end
end
