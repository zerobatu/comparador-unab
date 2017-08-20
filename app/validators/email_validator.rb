class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value.blank?
      value.split(',').each do|v|
        unless EmailValidator.validate(v)
          record.errors[attribute] << (options[:message] || "no es un E-mail")
          return
        end
      end
    end
  end

  def self.validate(email)
    if email.present?
      email.strip!
      (email =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i)
    end
  end
end
