class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :area_id, :municipalities, :address,
                            :building, :telephone_num, :purchase, :user_id, :item_id

  with_options presence: true do
    validates :post_code,      format: { with: /\A\d{3}-\d{4}$|^\d{3}-\d{2}$|^\d{3}\z/ }
    validates :area_id,        numericality: { other_than: 1 }
    validates :municipalities
    validates :address
    validates :telephone_num,  format: { with: /\A\d{10,11}\z/ }
    validates :user_id
    validates :item_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, area_id: area_id, municipalities: municipalities, address: address,
                   building: building, telephone_num: telephone_num, purchase_id: purchase.id)
  end
end