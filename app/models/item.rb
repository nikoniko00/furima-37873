class Item < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_condition
  belongs_to :payer
  belongs_to :prefecture
  belongs_to :waiting_day
  belongs_to :user
  has_one_attached :image
  has_one :order

  validates :category_id, :item_condition_id, :payer_id, :prefecture_id, :waiting_day_id, numericality: { other_than: 1, message: "is invalid" }
  validates :name, :explanation, :price, :image, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message:"Price is out of setting range" }

end
