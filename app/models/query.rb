class Query < ActiveRecord::Base
  belongs_to :user

  validates :instalment, presence: true
  validates :amount, presence: true
end
