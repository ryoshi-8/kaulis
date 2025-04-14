class ItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      case params[:item][:source]
      when "shop"
        redirect_to shops_path
      when "category"
        redirect_to category_path(@item.category_id)
      end
    end
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
  end

end