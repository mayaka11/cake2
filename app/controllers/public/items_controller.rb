class Public::ItemsController < ApplicationController


  def index
    @items = Item.all   #すべてのデータを表示するため、複数形にする。
  end

#商品詳細ページ
  def show
    @item = Item.find(params[:id])   #1つのデータを取得するので、単数形にする。
    @cart_item = CartItem
  end





private
  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price)
  end


end
