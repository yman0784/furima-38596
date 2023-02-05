class ShippingAddress < ApplicationRecord
  belongs_to :purchase_record
end
