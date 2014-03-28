class AddNextGroupToSurveys < ActiveRecord::Migration
  def change
    add_column :surveys, :next_group, :integer, :default => 0
  end
end
