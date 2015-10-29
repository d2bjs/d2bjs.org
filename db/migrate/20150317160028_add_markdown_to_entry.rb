class AddMarkdownToEntry < ActiveRecord::Migration
  def change
  	add_column :entries, :markdown, :text
  end
end
