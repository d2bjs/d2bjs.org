class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :type, default: 'ExampleCategory'
      t.string :fa_icon
      t.attachment :thumbnail

      t.timestamps null: false
    end
  end
end
