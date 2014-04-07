class RemoveYesFromAnswers < ActiveRecord::Migration
  def change
    remove_column :answers, :yes, :boolean
  end
end
