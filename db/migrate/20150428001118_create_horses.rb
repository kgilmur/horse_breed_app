class CreateHorses < ActiveRecord::Migration
  def change
    create_table :horses do |t|
      t.string :breed
      t.string :origin
      t.string :type

      t.timestamps null: false
    end
  end
end
