questions = [
  { question: 'How many years do you worked as a software developer?', type: 'Years' },
  { question: 'How many years do you worked as a web developer?', type: 'Years' },
  { question: 'How many projects have you completed?', type: 'Amount' },
  { question: 'What is your general programming skill level?', type: 'Skill-Level' },
  { question: 'What is your TypeScript skill level?', type: 'Skill-Level' },
  { question: 'What is your JavaScript skill level?', type: 'Skill-Level' },
  { question: 'What is your IndexedDB experience', type: 'Experience-Level' },
  { question: 'What is your Dexie.JS experience', type: 'Experience-Level' }
].freeze

SKILL_LEVEL = [
  :Novice,
  :Beginner,
  :Intermediate,
  :Proficient,
  :Advanced,
  :Expert
].freeze

EXPERIENCE_LEVEL = [:Unknown] + SKILL_LEVEL

types = {
  'Years' => {
    type: 'Rapidfire::Questions::Numeric'
  },
  'Amount' => {
    type: 'Rapidfire::Questions::Numeric'
  },
  'Skill-Level' => {
    type: 'Rapidfire::Questions::Radio',
    answer_options: SKILL_LEVEL
  },
  'Experience-Level' => {
    type: 'Rapidfire::Questions::Radio',
    answer_options: EXPERIENCE_LEVEL
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
    args = {
      question_text: question[:question],
      type: type[:type]
    }
    args[:answer_options] = type[:answer_options].join("\r\n") if type[:answer_options]
    args[:validation_rules] = type[:validation_rules] if type[:validation_rules]

    survey.questions.build(args)
  end

  survey.save!
end