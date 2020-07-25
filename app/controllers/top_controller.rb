class TopController < ApplicationController
  def index

    @items = Item.includes(:images).order('created_at DESC').page(params[:page]).per(5)
    
    @category_parent_array = Category.where(ancestry: nil)

  end
end
