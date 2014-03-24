class Survey < ActiveRecord::Base
  belongs_to :company

  has_many :questions
  has_many :customers
  has_many :answers, through: :questions
end
