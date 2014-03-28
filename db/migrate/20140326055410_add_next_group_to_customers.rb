class AddNextGroupToCustomers < ActiveRecord::Migration
  def change
    add_column :customers, :next_group, :integer, :default => 0
  end
end
