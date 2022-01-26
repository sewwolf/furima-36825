class RecordAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :street_number, :building_name, :telephone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :municipality
    validates :street_number
    validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/ }
  end
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :token, presence: true
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, telephone_number: telephone_number, record_id: record.id)
  end
end
