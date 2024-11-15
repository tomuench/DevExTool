feedback_questions = [
  'The questions in the survey were clear and easy to understand.',
  'The length of the survey was appropriate.',
  'The Likert scale options provided were easy to use and understand.',
  'The survey covered the topic comprehensively.',
  'I found the survey engaging and interesting.',
  'I felt the survey was relevant to my experiences.',
  'I did not experience any technical difficulties while completing the survey.',
  'Overall, I am satisfied with the survey.'
].freeze

LIKERT_OPTIONS = [
  'Strongly disagree',
  'Disagree',
  'Somewhat disagree',
  'Neither agree nor disagree',
  'Somewhat agree',
  'Agree',
  'Strongly agree'
].freeze

Rapidfire::Survey.new(
  :name => "Feedback",
  :introduction => "Thank you for taking the survey. Please provide your feedback on the survey experience.",
  :active => true,
  :after_survey_content => "Thank you for your feedback!"
) do |survey|
  feedback_questions.each do |question|
    survey.questions.build(
      :question_text => question,
      :type => "Rapidfire::Questions::Radio",
      :answer_options => LIKERT_OPTIONS.join("\r\n"),
    )
  end
  survey.save!
end
