class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :horses, :bloodtpye, :bloodtype
  end
end
