class RecordAddress 
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipality, :street_number, :building_name, :telephone_number,
                :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :municipality
    validates :street_number
  end
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'はハイフン(-)を含めた正しい値で入力してください' }, allow_blank: true
  validates :postal_code, presence: true

  validates :telephone_number, format: { with: /\A[0-9]{10,11}\z/, message: 'を正しい値で入力してください'}, allow_blank: true
  validates :telephone_number, presence: true

  validates :area_id, numericality: { other_than: 1, message: "を選択してください" }, allow_blank: true
  validates :token, presence: {message: "を正しく入力してください"}
  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipality: municipality, street_number: street_number,
                   building_name: building_name, telephone_number: telephone_number, record_id: record.id)
  end
end
