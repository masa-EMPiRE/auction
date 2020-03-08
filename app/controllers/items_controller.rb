class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
  end

  def index
    @items = Item.all
  end

  def new 
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)  #オブジェクトつくってる
    @item.save                     #newしてsave
    redirect_to @item              #showに飛ばして確認させる(一覧の場合は"/items")
  end

  def edit 
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])    #更新される前のデータ
    @item.update(item_params)         #下の値をアップデート
    redirect_to @item
  end

  def destroy 
    @item = Item.find(params[:id])          #データの取得
    @item.destroy                           #削除
    redirect_to items_path                   #一覧画面に遷移
  end

  private
  def item_params                                  #ストロングパラメーター
    params.require(:item).permit(:name, :price,    #外からは受け付けない、コントローラー内のみ
      :seller, :description, :email, :image_url)
  end
end
