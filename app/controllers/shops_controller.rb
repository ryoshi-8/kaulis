class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:items)

  end

  # def update
  #   @items.each do |item|
  #     item = Item.find(params[:id])
  #     item.update(checked: item_params[:checked])
  #   end
  #   redirect_to shops_path 
  # end

  # private
  # def item_params
  #   params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
  # end


end
