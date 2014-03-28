require 'spec_helper'

describe Company do
  describe 'Columns' do
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:encrypted_password).of_type(:string) }
    it { should have_db_column(:name).of_type(:string) }
  end

  describe 'Relations' do
    it { should have_many(:surveys) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name)  }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end
