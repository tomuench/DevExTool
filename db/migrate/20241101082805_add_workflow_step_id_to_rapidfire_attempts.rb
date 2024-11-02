class AddWorkflowStepIdToRapidfireAttempts < ActiveRecord::Migration[7.0]
  def change
    add_column :rapidfire_attempts, :workflow_step_id, :integer
    add_foreign_key :rapidfire_attempts, :workflow_steps
  end

end
