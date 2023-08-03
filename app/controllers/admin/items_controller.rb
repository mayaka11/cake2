class Admin::ItemsController < ApplicationController

  def new
    @item = Item.new    #１つのレコードを新規投稿するため、インスタンス変数は単数形の「@item」にする。
  end


  def create
    @item = Item.new(item_params)
    @item.save                      #投稿された情報を保存する。
    redirect_to admin_items_path(@item.id)    #投稿したものを登録後何処の画面を開くのかを書く。
  end


  def index
    @item = Item.new
    @items = Item.all   #すべてのレコードを取得するので、インスタンス変数は複数形の「@items」になり、「Item.all」=「アイテムのすべて」と書く。
  end


  def show
    @item = Item.find(params[:id])  #レコードを1件だけ取得するので、インスタンス変数名は単数形の「@item」にする。
  end

  def  edit
    @item = Item.find(params[:id])  #レコードを1件だけ取得するので、インスタンス変数名は単数形の「@item」にする。
  end


  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_items_path(item.id)
  end



private

  def item_params
    params.require(:item).permit(:name, :genre_id, :introduction, :price)
  end


end
