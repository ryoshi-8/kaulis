class ItemsController < ApplicationController
  def index
    @items = Item.order(:checked, :id)
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      respond_to do |format|
        format.html { redirect_to items_path }
        format.json { render json: @item }
      end
    else
      respond_to do |format|
        format.html { redirect_to items_path, alert: "更新失敗" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :checked, :user, :category, :shop)
  end
end