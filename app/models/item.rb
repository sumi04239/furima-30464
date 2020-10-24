class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition 
  belongs_to_active_hash :post_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :heading_time

  has_one_attached :image
  belongs_to :user

  validates :category_id, :condition_id, :post_payer_id,
            :prefecture_id, :heading_time_id, numericality: { other_than: 1 }

  with_options presence: true do
    validates :goods_name, length: { maximum: 40 }
    validates :description, length: { maximum: 1000 }
    validates :category_id
    validates :condition_id
    validates :post_payer_id
    validates :prefecture_id
    validates :heading_time_id
    validates :price, format: { with: /\A[a-zA-Z0-9]+\z/, message: "Price Half-width number"},
                      numericality: { only_integer: true, greater_than: 300, message: "must be greater than 300"},
                      numericality: { only_integer: true, less_than: 9999999, message: "must be less than 9,999,999"}

    validates :image
    
  end
end
