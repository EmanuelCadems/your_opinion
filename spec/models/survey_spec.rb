require 'spec_helper'

describe Survey do
  describe 'Columns' do
    it { should have_db_column(:introductory_text).of_type(:text) }
    it { should have_db_column(:goodbye_message).of_type(:text) }
    it { should have_db_column(:max_questions).of_type(:integer) }
    it { should have_db_column(:main_question).of_type(:string) }
    it { should have_db_column(:next_group).of_type(:integer) }
    it { should have_db_index(:company_id) }
  end

  describe 'Relations' do
    it { should belong_to(:company) }
    it { should have_many(:questions) }
    it { should have_many(:customers) }
    it { should have_many(:answers).through(:questions) }
  end
end
