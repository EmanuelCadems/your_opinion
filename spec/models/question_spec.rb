require 'spec_helper'

describe Question do
  describe 'Columns' do
    it { should have_db_column(:description).of_type(:string) }
    it { should have_db_column(:type_answer).of_type(:string) }
    it { should have_db_index(:survey_id) }
  end

  describe 'Relations' do
    it { should belong_to(:survey) }
    it { should have_many(:answers) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:description)  }
    it do
      should ensure_inclusion_of(:type_answer).
        in_array(Question::TYPE_ANSWERS).
        with_message("%{value} is not a valid type answer")
    end
  end
end
