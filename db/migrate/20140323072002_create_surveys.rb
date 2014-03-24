class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.text :introductory_text
      t.text :goodbye_message
      t.integer :max_questions
      t.string :main_question
      t.references :company, index: true

      t.timestamps
    end
  end
end
