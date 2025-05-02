class ShopsController < ApplicationController
  def index
    @shops = Shop.includes(:items)
  end

end
