class Record < ApplicationRecord
  attr_accessor :token

  belongs_to :user
  belongs_to :item
  has_one :address, dependent: :destroy
end
