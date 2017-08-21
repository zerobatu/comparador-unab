class Banco < ActiveRecord::Base
  mount_uploader :logo, IconoUploader

  validates :name, presence: true
  validates :interes_rate, presence: true

  attr_accessor :mortgage_credit_values

  def mortgage_credit(amount, foot, instalment)
    foot ||= 0
    credit = (amount * (100 - foot) / 100)
    foot_to_pay = amount - credit
    total_credit = instalment.times.inject(credit) { |c|  (c + (c * (interes_rate / 100.0))) }
    month_fee = total_credit / (instalment * 12)
    self.mortgage_credit_values = {
      credit: credit,
      foot_to_pay: foot_to_pay,
      total_credit: total_credit,
      month_fee: month_fee,
      interes_rate: interes_rate
    }
  end

  def self.compare(query)
    bancos = Banco.all
    return bancos.each do |b|
      b.mortgage_credit(query.amount, query.foot, query.instalment)
    end
  end
end
