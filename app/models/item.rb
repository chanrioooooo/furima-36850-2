class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :consignor
  belongs_to :shipping_area
  belongs_to :days_to_ship

  validates :product_name, :explanation, :category, :situation, :consignor, :shipping_area, :days_to_ship, :price, presence: true

  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :consignor_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :days_to_ship_id,  numericality: { other_than: 1 , message: "can't be blank" }

  has_one_attached :image
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
