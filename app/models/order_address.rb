class OrderAddress
 include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :lot_number, :building_name, :phone_number,:user_id, :item_id, :token

  validates :prefecture_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)" }
    validates :prefecture_id
    validates :city
    validates :lot_number
    validates :phone_number, length: { maximum: 11 }
    validates :token
  end

    def save
      order = Order.create( item_id: item_id, user_id: user_id)
      Address.create( post_code: post_code, prefecture_id: prefecture_id, city: city, lot_number: lot_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
    end
end