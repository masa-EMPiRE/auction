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

  private
  def item_params
    params.require(:item).permit(:name, :price, 
      :seller, :description, :email, :image_url)
  end
end
