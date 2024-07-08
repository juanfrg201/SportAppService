class CreateEjercices < ActiveRecord::Migration[7.1]
  def change
    create_table :ejercices do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.string :series
      t.string :repeticions
      t.string :weight
      t.integer :day

      t.timestamps
    end
  end
end
