class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :price, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :token
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Enter it as follows (e.g. 123-4567)"}
  end

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  validates :municipalities, presence: { message: "can't be blank" }
  validates :address, presence: { message: "can't be blank" }
  validates :telephone_number, presence: { message: "can't be blank" }
  
  validates :telephone_number, numericality: {only_integer: true, message: "is invalid. Input only number"}
  validates :telephone_number, length: { minimum: 10, message: "is too short" }

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id )

  end

end