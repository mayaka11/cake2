class Public::CartItemsController < ApplicationController

before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.includes([:item])
    @total = 0
  end


  def create
    #データを受け取り新規登録するためのインスタンス作成
    @cart_item = current_customer.cart_items.new(cart_item__params)
    #「もし」元々カート内に同じ商品がある場合、「数量を追加」更新・保存する
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      #元々カート内にあるもの「item_id」
      cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      #cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
      #.to_iとして数字として扱う
      cart_item.amount += params[:cart_item][:amount].to_i
      #データをデータベースに保存するためのsaveメソッド実行
      cart_item.save
    else
      @cart_item.save!
    end
       #カート内商品画面へリダイレクト
      redirect_to cart_items_path
  end


  def update
  end


  def destroy
    #データ(レコード)を1件取得
    cart_item = Cart_item.find(params[:id])
    #データ(レコード)を削除
    cart_item.destroy
    redirect_to cart_items_path
  end


  def destroy_all
  end



private

  def cart_item_params
    params.require(:cart_item).permit(:itrm_id, :customer_id, :amount)
  end
end
