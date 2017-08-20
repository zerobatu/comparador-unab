class User < ActiveRecord::Base
  has_one :query
  accepts_nested_attributes_for :query

  validates :email, presence: true, email: true
  validates :name, presence: true
  validates :rut, presence: true
  validates :birthday, presence: true
end
