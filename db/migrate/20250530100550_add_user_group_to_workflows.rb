class AddUserGroupToWorkflows < ActiveRecord::Migration[7.0]
  def change
    add_column :workflows, :user_group, :string
  end
end
