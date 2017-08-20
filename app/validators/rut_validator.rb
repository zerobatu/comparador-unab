class RutValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present?
      value = value.strip.gsub('K', 'k')
      _value = value.split('-').first.to_i
      dv = value.split('-').last
      v = 1
      sum = 0
      for i in (2..9)
        i == 8 ? v = 2 : v += 1
        sum += v * (_value % 10)
        _value /= 10
      end
      sum = 11 - sum % 11
      valid_value = false
      if sum == 11
        valid_value = '0' == dv
      elsif sum == 10
        valid_value = 'k' == dv
      else
        valid_value = sum.to_s == dv
      end
      unless valid_value
        record.errors[attribute] << (options[:message] || I18n.t('general.validation_errors.rut'))
      end
    end
  end
end
