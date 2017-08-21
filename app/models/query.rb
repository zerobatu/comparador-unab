class Query < ActiveRecord::Base
  belongs_to :user

  INSTALMENT = (1..6).map { |i| i*5 }

  validates :instalment, inclusion: {
    in: INSTALMENT,
    message: 'debe ingresar un plazo valido'
  }

  validates :amount, numericality: {
    greater_than: 999_999,
    message: 'El monto debe ser mayor a $1.000.000'
  }

  validates :amount, numericality: {
    less_than_or_equal_to: 1_000_000_000,
    message: 'El monto no debe los $10.000.000.000'
  }

  validates :foot, numericality: {
    greater_than: 0,
    less_than_or_equal_to: 100,
    message: 'Porcentaje incorrecto'
  }, allow_blank: true
end
