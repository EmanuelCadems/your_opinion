class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :description
      t.string :type_answer
      t.references :survey, index: true

      t.timestamps
    end
  end
end
