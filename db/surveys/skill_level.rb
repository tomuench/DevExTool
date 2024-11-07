questions = [
  { question: 'How long do you worked as a software developer?', type: 'Years' },
  { question: 'How long do you worked as a web developer?', type: 'Years' },
  { question: 'How many projects have you completed?', type: 'Amount' },
  { question: 'What is your general programming skill level?', type: 'Skill-Level' },
  { question: 'What is your TypeScript skill level?', type: 'Skill-Level' },
  { question: 'What is your JavaScript skill level?', type: 'Skill-Level' },
  { question: 'What is your IndexedDB experience', type: 'Experience-Level' },
  { question: 'What is your Dexie.JS experience', type: 'Experience-Level' }
].freeze

types = {
  'Years' => {
    type: 'Rapidfire::Questions::Numeric',
    validation_rules: { presence: '1', minimum: '0', maximum: '50' }
  },
  'Amount' => {
    type: 'Rapidfire::Questions::Numeric',
    validation_rules: { presence: '1', minimum: '0', maximum: '500' }
  },
  'Skill-Level' => {
    type: 'Rapidfire::Questions::Radio',
    answer_options: [] # TODO
  },
  'Experience-Level' => {
    type: 'Rapidfire::Questions::Radio',
    answer_options: [] # TODO
  }
}

Rapidfire::Survey.new(
  name: 'Skill',
  introduction: 'Skill Level Survey',
  active: true,
  after_survey_content: 'Thank you for taking the Skill Level Survey'
) do |survey|
  questions.each do |question|
    type = types[question[:type]]
    survey.questions.build(
      question_text: question[:question],
      type: type[:type],
      answer_options: type[:answer_options],
      validation_rules: type[:validation_rules]
    )
  end

  survey.save!
end