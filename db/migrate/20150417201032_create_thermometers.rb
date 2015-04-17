class CreateThermometers < ActiveRecord::Migration
  def change
    create_table :thermometers do |t|
      t.decimal :temperature

      t.timestamps null: false
    end
  end
end
