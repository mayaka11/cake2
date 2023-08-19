class Public::CartItemsController < ApplicationController


  def index
    @cart_items = current_customer.cart_items.includes([:item])
    @total = 0
  end


  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @cart_item = current_customer.cart_items.new(cart_item__params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    cart_item.save
    # 4. カート内商品画面へリダイレクト
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
