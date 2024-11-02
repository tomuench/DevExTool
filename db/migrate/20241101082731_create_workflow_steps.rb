class CreateWorkflowSteps < ActiveRecord::Migration[7.0]
  def change
    create_table :workflow_steps do |t|
      t.integer :workflow_id
      t.time :start
      t.string :title
      t.text :description
      t.time :end

      t.timestamps
    end

    add_foreign_key :workflow_steps, :workflows
  end
end
