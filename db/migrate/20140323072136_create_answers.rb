class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :scale
      t.boolean :yes
      t.string :happy_level
      t.references :question, index: true
      t.references :customer, index: true

      t.timestamps
    end
  end
end
