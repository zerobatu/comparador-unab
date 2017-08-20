class Banco < ActiveRecord::Base
  mount_uploader :logo, IconoUploader

  validates :name, presence: true
  validates :interes_rate, presence: true
end
