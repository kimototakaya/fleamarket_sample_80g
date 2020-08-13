class ItemsController < ApplicationController

  def index
    @items = Item.includes(:images).order('created_at DESC')
    @parents = Category.all.order("id ASC").limit(13)
  end
  

  def show
  end

  def new
    @item = Item.new
    @item.images.new
    @item.build_shipping
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :detail, :condition, :category_id, :brand_id, :size_id, :user_id, images_attributes: [:src], shipping_attributes: [:fee_burden, :method, :prefecture_from, :period_before_shipping, :id])
    
  end

end
