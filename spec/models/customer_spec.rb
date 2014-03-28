require 'spec_helper'

describe Customer do
  describe 'Columns' do
    it { should have_db_column(:name).of_type(:string) }
    it { should have_db_column(:sex).of_type(:string) }
    it { should have_db_column(:comment).of_type(:text) }
    it { should have_db_column(:created_at).of_type(:datetime) }
    it { should have_db_column(:updated_at).of_type(:datetime) }
    it { should have_db_column(:next_group).of_type(:integer).with_options(default: 0) }
    it { should have_db_index(:survey_id) }
  end

  describe 'Relations' do
    it { should belong_to(:survey) }
    it { should have_many(:answers) }
  end

  describe 'Callbacks' do
    before(:each) do
      survey    = create(:survey, max_questions: 5)
      questions = create_list(:question, 13, survey: survey)
      @customer  = build(:customer, survey: survey)
    end

    describe 'set_next_group' do
      it "should update the next_group with the corresponding group of customer questions" do
        expect{ @customer.save }.to change{ @customer.next_group }.by(1)
      end

      it "should update the next_group in the survey with the corresponding group of customer questions" do
        expect{ @customer.save }.to change{ @customer.survey.next_group }.by(1)
      end
    end
  end
end
