
questions = [
  {
    question: 'What is your age?',
    type: 'Rapidfire::Questions::Numeric'
  },
  {
    question: 'What is your gender?',
    type: 'Rapidfire::Questions::Radio',
    answer_options: ['Male', 'Female', 'Other'].join("\r\n")
  },
  {
    question: 'What is your academic background?',
    type: 'Rapidfire::Questions::Radio',
    answer_options: ['B.Sc', 'M.Sc', 'PhD/Dr', 'Prof', 'None'].join("\r\n")
  },
  {
    question: 'What is your profession or job title?',
    type: 'Rapidfire::Questions::Short'
  },
  {
    question: 'From where do you participate in the study?',
    type: 'Rapidfire::Questions::Radio',
    answer_options: ['Home office', 'Office', 'Mobile'].join("\r\n")
  }
].freeze

Rapidfire::Survey.new(
  name: 'Demography',
  introduction: 'Demography Survey',
  active: true,
  after_survey_content: 'Thank you for taking the Demography Survey'
) do |survey|
  questions.each do |question|
    args = {
      question_text: question[:question],
      type: question[:type]
    }
    args[:answer_options] = question[:answer_options] if question[:answer_options]
    args[:validation_rules] = question[:validation_rules] if question[:validation_rules]

    survey.questions.build(args)
  end

  survey.save!
end