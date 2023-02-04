class Item < ApplicationRecord
  belongs_to :user
  
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :prefecture
  belongs_to :shipping_date 


  has_one_attached :image

  with_options presence: true do
    validates :name
    validates :info
    validates :image
    validates :price
  end

  validates :price, numericality: { only_iteger: true, message:'is invalid. Input half-width characters' }
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'is out of setting range' }

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}

end
