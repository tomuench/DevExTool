questions = [
  'I feel I am competent enough to meet the high demands of the situation',
  'I do things spontaneously and automatically without having to think',
  'I have a strong sense of what I want to do',
  'I have a good idea while I am performing about how well I am doing',
  'I am completely focused on the task at hand',
  'I have a feeling of total control',
  'I am not worried about what others may be thinking of me',
  'The way time passes seems to be different from normal.',
  'The experience is extremely rewarding'
].freeze

LIKERT_OPTIONS = [
  'Strongly disagree',
  'disagree',
  'Somewhat disagree',
  'Neither agree nor disagree',
  'Somewhat agree',
  'Agree',
  'Strongly agree'
].freeze

Rapidfire::Survey.new(
  :name => "SDFS",
  :introduction => "SDFS Survey",
  :active => true,
  :after_survey_content => "Thank you for taking the SDFS Survey"
) do |survey|
    questions.each do |question|
      survey.questions.build(
        :question_text => question,
        :type => "Rapidfire::Questions::Checkbox",
        :answer_options => LIKERT_OPTIONS.join("\r\n"),
      )
    end
    survey.save!
end