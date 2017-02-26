class AddOrderToWidgets < ActiveRecord::Migration
  def change
    add_column :widgets, :order, :integer, default: 0
  end
end
