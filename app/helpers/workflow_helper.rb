module WorkflowHelper

  # Check if the attempt is finished
  # @param [Rapidfire::Attempt] attempt
  # @return [String]
  def attempt_state(attempt)
    attempt.answers.where(answer_text: nil).exists? ? '' : 'is-success'
  end


  # Check if the attempt is finished
  # @param [WorkflowStep] step
  # @return [String]
  def workflow_step_state(step)
    case step.state
    when :active
      'is-warning'
    when :completed
      'is-success'
    else
      ''
    end
  end
end
