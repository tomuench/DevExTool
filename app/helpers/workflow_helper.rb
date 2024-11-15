module WorkflowHelper

  # Check if the attempt is finished
  # @param [Rapidfire::Attempt] attempt
  # @return [String]
  def attempt_state(attempt)
    attempt_finished?(attempt) ? '' : 'is-success'
  end

  def attempt_disabled(attempts,index)
    return false if index == 0

    attempt_finished?(attempts[index-1])
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

  def workflow_step_disabled(steps,index)
    return false if index == 0

    step = steps[index-1]
    step.state != :completed
  end

  # Check if the attempt is finished
  # @param [Rapidfire::Attempt] attempt
  # @return [Boolean]
  def attempt_finished?(attempt)
    !attempt.answers.where.not(answer_text: nil).exists?
  end
end
