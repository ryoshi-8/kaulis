# class ItemsController < ApplicationController
#   def update
#     @items.each do |item|
#       item = Item.find(params[:id])
#       item.update(checked: item_params[:checked])
#     end
#     redirect_to shops_path 
#   end

#   private
#   def item_params
#     params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
#   end

# end

# class ItemsController < ApplicationController
#   def update
#     @item = Item.find(params[:id])
#     @item.update(item_params)
#   end

#   private
#   def item_params
#     params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
#   end

# end

class ItemsController < ApplicationController
  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
  end

end

# class ItemsController < ApplicationController
#   def update
#     @item = Item.find(params[:id])
#     if @item.update(item_params)
#       # item.shop を使って、リダイレクト先を決める
#       redirect_to shops_path(@item.shop), notice: "更新しました！"
#     else
#       redirect_to shops_path(@item.shop), alert: "更新に失敗しました。"
#     end
#   end

#   private
#   def item_params
#     params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
#   end

# end