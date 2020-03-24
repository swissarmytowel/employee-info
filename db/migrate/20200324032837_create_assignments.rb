class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :project, null: false, foreign_key: true

      t.timestamps
    end
    add_index :assignments, :employee
    add_index :assignments, :project
    add_index :assignments, [:employee, :project]
  end
end
