class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :consignor
  belongs_to :area
  belongs_to :day

  validates :product_name, :explanation, :category, :situation, :consignor, :area, :day, :price, presence: true

  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :consignor_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :day_id,           numericality: { other_than: 1 , message: "can't be blank" }

  has_one_attached :image

end
