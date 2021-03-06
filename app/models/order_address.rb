#
# class OrderAddress
#   include ActiveModel::Model
#   attr_accessor :post_code, :prefecture_id, :city, :address, :building, :telephone_number, :user_id, :item_id, :token
#
#   with_options presence: true do
#     validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "はハイフン(-)を含めて入力してください" }
#     validates :prefecture_id
#     validates :city
#     validates :address
#     validates :telephone_number
#     validates :user_id
#     validates :item_id
#     validates :token
#   end
#   validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }
#   validates :telephone_number, format: { with: /\A\d{10,11}\z/, message: "は10桁〜11桁の半角数字で入力してください"}
#   def save
#     order = Order.create(user_id: user_id, item_id: item_id)
#     Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
#                    telephone_number: telephone_number, building: building, order_id: order.id)
#   end
# end
#
