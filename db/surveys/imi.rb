# Intrinsic motivation inventory (IMI) survey

questions = [
  'I enjoy software development work very much',
  'I think software development is a boring activity',
  'I enjoy using Dexie.JS / Web Standards very much',
  'I am satisfied with my performance at software development',
  'I am pretty skilled in software development',
  'I am pretty skilled in using Web Standards',
  'I am pretty skilled in using Dexie.JS',
  'It is important to me to do well in software development'
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
  :name => "IMI",
  :introduction => "IMI Survey",
  :active => true,
  :after_survey_content => "Thank you for taking the IMI Survey"
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