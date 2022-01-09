class Item < ApplicationRecord
  with_options presence: true do
  validates :image
  validates :item_name
  validates :detail
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  end
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :area_id, numericality: { other_than: 1, message: "can't be blank" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "can't be blank" }
  

  extend ActiveHash::Associations::ActiveRecordExtensions do
  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_time
  belongs_to :area
  end
  has_one_attached :image
end
