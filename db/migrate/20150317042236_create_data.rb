class CreateData < ActiveRecord::Migration
  def change
    create_table :data do |t|
      t.string :name
      t.text :body
      t.integer :entry_id

      t.timestamps null: false
    end
  end
end
