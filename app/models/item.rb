class Item < ApplicationRecord
  with_options presence: true do
    validates :item_name
    validates :detail
  end
  validates :image, presence: {message: "を選択してください"}
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }, allow_blank: true
  validates :price, presence: true

  validates :category_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :condition_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :postage_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :area_id, numericality: { other_than: 1, message: "を選択してください" }
  validates :delivery_time_id, numericality: { other_than: 1, message: "を選択してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :category
    belongs_to :condition
    belongs_to :postage
    belongs_to :delivery_time
    belongs_to :area
  end
  belongs_to :user
  has_one :record, dependent: :destroy

  has_one_attached :image
end
