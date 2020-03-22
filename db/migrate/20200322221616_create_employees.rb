class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :telegram_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :employees, :name
    #Ex:- add_index("admin_users", "username")
  end
end
