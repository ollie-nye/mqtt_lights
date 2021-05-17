class CreateZones < ActiveRecord::Migration[6.1]
  def change
    create_table :zones do |t|
      t.string :name
      t.integer :first
      t.integer :last
      t.integer :brightness
      t.integer :red
      t.integer :green
      t.integer :blue

      t.timestamps
    end
  end
end
