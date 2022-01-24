class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions do
    belongs_to :area
  end
  belongs_to :record
end
