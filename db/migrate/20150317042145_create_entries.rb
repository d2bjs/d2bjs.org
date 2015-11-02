class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      # t.string :iframe
      t.text :markdown
      t.text :description
      t.attachment :thumbnail
      # t.text :code
      t.boolean :private

      t.timestamps null: false
    end
  end
end
