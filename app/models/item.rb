class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :shipping_cost, :prefecture, :shipping_date 

  validates :name, :info, presence: true

  validates :category_id, :condition_id, :shipping_cost_id, :prefecture_id, :shipping_date_id, numericality: { other_than: 1 , message: "can't be blank"}
end
