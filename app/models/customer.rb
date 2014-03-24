class Customer < ActiveRecord::Base
  belongs_to :survey
  has_many :answers
end
