class Item < ApplicationRecord
<<<<<<< Updated upstream
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :consignor
  belongs_to :area
  belongs_to :day

  belongs_to :user
  has_one_attached :image

  validates :image, :product_name, :explanation, :category, :situation, :consignor, :area, :day, :price, presence: true

  validates :category_id,      numericality: { other_than: 1 , message: "can't be blank" }
  validates :situation_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :consignor_id,     numericality: { other_than: 1 , message: "can't be blank" }
  validates :area_id,          numericality: { other_than: 1 , message: "can't be blank" }
  validates :day_id,           numericality: { other_than: 1 , message: "can't be blank" }
  validates :price,            numericality: { only_integer:true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

=======
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
>>>>>>> Stashed changes
end
