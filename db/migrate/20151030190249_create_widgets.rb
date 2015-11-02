class CreateWidgets < ActiveRecord::Migration
  def change
    create_table :widgets do |t|
      t.integer :entry_id
      t.string :type, default: 'general'
      t.string :name
      t.string :iframe_url
      t.text :embedded_code
      t.attachment :image
      t.text :markdown
      t.text :caption
      t.integer :index

      t.timestamps null: false
    end
  end
end
