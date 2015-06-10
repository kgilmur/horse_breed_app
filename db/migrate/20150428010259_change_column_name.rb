class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :horses, :bloodtype
  end
end
