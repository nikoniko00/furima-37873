class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.order('created_at DESC')
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
    unless @item.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show, id: params[:id]
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      redirect_to root_path if @item.destroy
    end
  end

end

private

def item_params
  params.require(:item).permit(:name, :explanation, :category_id, :item_condition_id, :payer_id, :prefecture_id, :waiting_day_id,
                               :price, :image).merge(user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:id])
end
