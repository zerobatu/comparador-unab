class User < ActiveRecord::Base
  has_one :query
  accepts_nested_attributes_for :query

  validates :email, presence: true, email: true
  validates :name, presence: true
  validates :rut, presence: true
  validates :birthday, presence: true
  validate :check_birthday

  private
    def check_birthday
      if birthday.present? and birthday > (Date.today - 18.year)
        errors.add(:birthday, "Debe ser mayor de edad")
      end
    end
end
