class Workflow < ApplicationRecord

  belongs_to :user

  has_many :workflow_steps

  # Generating every workflow step for a new user
  def create_workflow_steps
    # Create a new workflow step for every step in the workflow
    step1 = self.workflow_steps.create(
      position: 1,
      title: 'Demographic and skill level',
      description: 'Survey about demographics and skills',
      survey_ids: [4]
    )

    self.workflow_steps.create(
      position: 2,
      title: 'Task 1',
      description: 'Task 1 with surveys'
    )
    self.workflow_steps.create(
      position: 3,
      title: 'Task 2',
      description: 'Task 2 with surveys'
    )
    self.workflow_steps.create(
      position: 4,
      title: 'Step 3',
      description: 'Feedback'
    )
  end
end
