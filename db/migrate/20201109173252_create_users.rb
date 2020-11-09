class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :mod
      t.text :bio
      t.string :location

      t.timestamps
    end
  end
end
