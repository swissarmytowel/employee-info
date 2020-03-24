class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.references :employee
      t.references :project

      t.timestamps
    end
  end
end
