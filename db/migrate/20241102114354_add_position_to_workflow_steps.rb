class AddPositionToWorkflowSteps < ActiveRecord::Migration[7.0]
  def change
    add_column :workflow_steps, :position, :integer
  end
end
