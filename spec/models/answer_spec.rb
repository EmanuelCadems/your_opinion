require 'spec_helper'

describe Answer do
  describe 'Columns' do
    it { should have_db_column(:scale).of_type(:integer) }
    it { should have_db_column(:yes_or_not).of_type(:string) }
    it { should have_db_column(:happy_level).of_type(:string) }
    it { should have_db_index(:question_id) }
    it { should have_db_index(:customer_id) }
  end

  describe 'Relations' do
    it { should belong_to(:question) }
    it { should belong_to(:customer) }
  end

  describe 'Delegators' do
    it { should respond_to(:question_description) }
    it { should respond_to(:question_type_answer) }
  end
end
