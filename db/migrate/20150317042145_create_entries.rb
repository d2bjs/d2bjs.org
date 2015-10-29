class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.text :description
      t.text :code
      t.boolean :private

      t.timestamps null: false
    end
  end
end
