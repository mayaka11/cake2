class CartItem < ApplicationRecord

  belongs_to :item

  belongs_to :customer



 ##少数を求めるメゾッド
  def subtotal
    item.with_tax_price * amount
  end


end
