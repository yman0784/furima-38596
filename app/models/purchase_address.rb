class PurchaseAddress 
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :municipalities, :address, :building_name, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    # validates :price, numericality: {only_integer: true}
    end

    validates :postal_code, presence: { message: "can't be blank" }
    validates :municipalities, presence: { message: "can't be blank" }
    validates :address, presence: { message: "can't be blank" }
    validates :building_name, presence: { message: "can't be blank" }
    validates :telephone_number, presence: { message: "can't be blank" }
    

  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}

  def save
    purchase_record = PurchaseRecord.create(user_id: user_id, item_id: item_id)
    ShippingAddress.create(postal_code: postal_code, prefecture_id: prefecture_id, municipalities: municipalities, address: address, building_name: building_name, telephone_number: telephone_number, purchase_record_id: purchase_record.id )

  end

end