class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :sex
      t.text :comment
      t.references :survey, index: true

      t.timestamps
    end
  end
end
