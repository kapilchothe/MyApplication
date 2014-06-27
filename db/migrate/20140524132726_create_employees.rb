class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :designation
      t.integer :department_id

      t.timestamps
    end
  end
end
