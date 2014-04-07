class AddYesOrNotToAnswers < ActiveRecord::Migration
  def change
    add_column :answers, :yes_or_not, :string
  end
end
