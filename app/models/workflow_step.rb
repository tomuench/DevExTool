class WorkflowStep < ApplicationRecord

  belongs_to :workflow
  has_many :surveys, class_name: 'Rapidfire::Attempt', foreign_key: 'workflow_step_id'

  attr_accessor :survey_ids

  after_create :create_surveys


  def create_surveys
    if survey_ids
      survey_ids.each do |survey_id|
        survey = Rapidfire::Survey.find(survey_id)
        surveys.create(survey_id: survey_id, user: workflow.user)
      end
    end
  end
end
