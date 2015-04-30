class CreateHorsesTags < ActiveRecord::Migration
  def change
    create_table :horses_tags do |t|
      t.references :horse, index: true, foreign_key: true
      t.references :tag, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
