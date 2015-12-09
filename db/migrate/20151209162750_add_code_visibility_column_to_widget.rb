class AddCodeVisibilityColumnToWidget < ActiveRecord::Migration
  def change
    add_column :widgets, :code_visibility, :string, default: "js"
  end
end
