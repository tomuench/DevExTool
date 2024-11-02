class CreateWorkflows < ActiveRecord::Migration[7.0]
  def change
    create_table :workflows do |t|
      t.integer :user_id

      t.timestamps
    end

    add_foreign_key :workflows, :users
  end
end
