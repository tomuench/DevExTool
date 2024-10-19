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
  'Years' => 'Rapidfire::Questions::Date',
  'Amount' => 'Rapidfire::Questions::Numeric',
  'Skill-Level' => 'Rapidfire::Questions::Radio',
  'Experience-Level' => 'Rapidfire::Questions::Radio'
}
