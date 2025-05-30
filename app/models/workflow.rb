class Workflow < ApplicationRecord
  USER_GROUP_A = 'A'.freeze # UserGroup A gets the first task Dexie and Second
  USER_GROUP_B = 'B'.freeze # UserGroup A gets the first task Standards and Second Dexie


  belongs_to :user

  has_many :workflow_steps

  # Generating every workflow step for a new user
  def create_workflow_steps
    # Create a new workflow step for every step in the workflow
    step1 = self.workflow_steps.create(
      position: 1,
      title: 'Registration, Skills, and Motivation',
      description: 'Welcome to the first step of our survey! Here, we’ll get to know a bit about you as a developer.' +
        'We’ll start with a quick registration, followed by questions about your development skills and experience. ' +
        'Finally, we’ll check in on your initial motivations and interests as we begin this study. This information ' +
        'helps us tailor our analysis to better understand how different skills and experiences might impact developer ' +
        'experiences.',
      survey_ids: survey_ids([:Demography, :Skill, :IMI, :SDFS])
    )

    self.workflow_steps.create(
      position: 2,
      title: 'First Task and Experience Assessment',
      description: 'In this section, you’ll tackle your first development task. You\'ll have the chance to work on it ' +
        'independently, applying your skills in a real-world setting. After you complete the task, we’ll gather your ' +
        'feedback and check in on your motivation and flow state. This step-by-step assessment allows us to understand ' +
        'how this type of task impacts your engagement, motivation, and overall experience. ' +
        link_first_task,
      survey_ids: survey_ids([:IMI, :SDFS, :DEXI]) # IMI SDFS DEXI
    )
    self.workflow_steps.create(
      position: 3,
      title: 'Second Task and Comparative Experience Assessment',
      description: 'You’re now ready for the second task! Similar to the previous section, you’ll work independently on ' +
        'a different approach to the same problem. Once completed, we’ll again gather your feedback and assess how this ' +
        'experience compares with the first task. Through this, we aim to explore how different tools and approaches ' +
        'influence your developer experience. ' +
        link_second_task,
      # TODO wie messe ich hier start, end und code-metrics
      survey_ids: survey_ids([:IMI, :SDFS, :DEXI])  # IMI SDFS DEXI
    )
    self.workflow_steps.create(
      position: 4,
      title: 'Final Feedback',
      description: 'Congratulations on reaching the last step! In this final section, we’d love to hear your overall ' +
        'thoughts on the study. This feedback helps us understand your experience as a whole and provides valuable ' +
        'insights for improving developer tools and resources. Thank you for participating and sharing your unique ' +
        'perspective!',
      survey_ids: survey_ids([:Feedback]) # Feedback Form
    )
  end

  private
  def link_first_task
    user_group == USER_GROUP_A ? link_dexie : link_standards
  end

  def link_second_task
    user_group == USER_GROUP_A ? link_standards : link_dexie
  end

  def link_dexie
    '<a target="_blank" href="/DevExTaskA.pdf">Click here to get your task instructions</a>'
  end

  def link_standards
    '<a target="_blank" href="/DevExTaskB.pdf">Click here to get your task instructions</a>'
  end

  # Load survey ids for creating surveys
  # @param names [Array] names of the surveys
  # @return [Array] survey ids
  def survey_ids(names = [])
    surveys = Rapidfire::Survey.where(name: names)
    surveys.map(&:id)
  end
end
