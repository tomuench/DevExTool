class WorkflowStep < ApplicationRecord

  belongs_to :workflow
  has_many :attempts, class_name: 'Rapidfire::Attempt', foreign_key: 'workflow_step_id'

  attr_accessor :survey_ids

  after_create :create_surveys

  def state
    case attempts_finished_count
    when 0
      :pending
    when attempts.count
      :completed
    else
      :active
    end
  end

  def create_surveys
    if survey_ids
      survey_ids.each do |survey_id|
        survey = Rapidfire::Survey.find(survey_id)
        builder = Rapidfire::AttemptBuilder.new(survey: survey, user: workflow.user, params: {})
        builder.save(validate: false)
        builder.to_model.update(workflow_step_id: id)
      end
    end
  end

  private

  def attempts_finished_count
    attempts.includes(:answers).sum do |attempt|
      attempt.answers.any? { |answer| !answer.answer_text.nil? } ? 1 : 0
    end
  end
end
